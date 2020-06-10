$(function () {
    $("#jqGrid").Grid({
        url: '../recruitment/list',
        colModel: [{
            label: 'id', name: 'id', index: 'id', key: true, hidden: true
        }, {
            label: '商人ID', name: 'merchantId', index: 'merchant_id', width: 80
        }, {
            label: 'checked', name: 'checked', index: 'checked'
        }, {
            label: '标题', name: 'title', index: 'title'
        }, {
            label: '备注', name: 'detail', index: 'detail'
        }, {
            label: '地址', name: 'vocation', index: 'vocation'
        }]
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        recruitment: {
            gender: 1
        },
        ruleValidate: {
        	title: [
                {required: true, message: '招聘标题不能为空', trigger: 'blur'}
            ]
        },
        q: {
        	title: ''
        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.recruitment = {gender: '1'};
        },
        update: function (event) {
            var id = getSelectedRow("#jqGrid");
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.recruitment.id == null ? "../recruitment/save" : "../recruitment/update";

            Ajax.request({
                type: "POST",
                url: url,
                contentType: "application/json",
                params: JSON.stringify(vm.recruitment),
                successCallback: function (r) {
                    alert('操作成功', function (index) {
                        vm.reload();
                    });
                }
            });
        },
        del: function (event) {
            var ids = getSelectedRows("#jqGrid");
            if (ids == null) {
                return;
            }
            confirm('确定要删除选中的记录？', function () {
                Ajax.request({
                    type: "POST",
                    url: "../recruitment/delete",
                    contentType: "application/json",
                    params: JSON.stringify(ids),
                    successCallback: function (r) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    }
                });

            });
        },
        getInfo: function (id) {
            Ajax.request({
                url: "../recruitment/info/" + id,
                async: true,
                successCallback: function (r) {
                    vm.recruitment = r.recruitment;
                }
            });
        },
        reload: function (event) {
            vm.showList = true;
            $("#jqGrid").jqGrid('setGridParam', {
            	postData: {"title":vm.q.title}
            }).trigger("reloadGrid");
            vm.handleReset('formValidate');
        },
        handleSubmit: function (name) {
            handleSubmitValidate(this, name, function () {
                vm.saveOrUpdate()
            });
        },
        handleReset: function (name) {
            handleResetForm(this, name);
        }
    }
});