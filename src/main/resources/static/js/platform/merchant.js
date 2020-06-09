$(function () {
    $("#jqGrid").Grid({
        url: '/merchant/list',
        colModel: [{
            label: 'id', name: 'id', index: 'id', key: true, hidden: true
        }, {
            label: '用户名称', name: 'account.account', index: 'account.account', width: 80
        }, {
            label: '用户密码', name: 'account.password', index: 'account.password', hidden: true
        },{
            label: '名字', name: 'account.name', index: 'account.name', width: 80
        }, {
            label: '性别', name: 'account.gender', index: 'account.gender', width: 40, formatter: function (value) {
                return transGender(value);}
        }, {
            label: '手机号码', name: 'account.phoneNumber', index: 'account.phoneNumber', width: 120
        },{
            label:'年龄', name: 'account.age', index: 'account.age',width: 80
        },{
            label: '备注',name: 'account.detail',index: 'account.detail',width: 120
        },{
            label: '待审核', name: 'account.checked', index: 'account.checked', width: 80},{
            label: '商户类型', name: 'account.type', index: 'account.type', hidden: true
        },{
            label: '注册资本', name: 'account.registeredCapital', index: 'account.registeredCapital', width: 80
        }, {
            label: '注册日期', name: 'account.initialDate', index: 'account.initialDate', width: 80
        }, {
            label: '注册地址', name: 'account.registeredAddress', index: 'account.registeredAddress', width: 120
        },{
            label:'业务范围', name: 'account.businessScope', index: 'account.businessScope',width: 80
        },{
            label: '评分',name: 'account.score',index: 'account.score',width: 120
        }]

    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        user: {
            gender: 1
        },
        merchant: {
            account:{
                gender: 1
            }
        },
        ruleValidate: {
            username: [
                {required: true, message: '会员名称不能为空', trigger: 'blur'}
            ]
        },
        q: {
            username: ''
        },
        userLevels: []
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.user = {gender: '1'};
            vm.userLevels = [];

            // this.getUserLevels();
        },
        update: function (event) {
            var id = getSelectedRow("#jqGrid");
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
            // this.getUserLevels();
        },
        saveOrUpdate: function (event) {
            var url = vm.merchant.id == null ? "/merchant/save" : "/merchant/update";

            Ajax.request({
                type: "POST",
                url: url,
                contentType: "application/json",
                params: JSON.stringify(vm.merchant),
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
                    url: "/merchant/delete",
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
        exportUser: function () {
            exportFile('#rrapp', '/merchant/export');
        },
        coupon: function () {
            var id = getSelectedRow("#jqGrid");
            if (id == null) {
                return;
            }
            openWindow({
                title: '优惠券',
                type: 2,
                content: '../shop/usercoupon.html?userId=' + id
            })
        },
        address: function () {
            var id = getSelectedRow("#jqGrid");
            if (id == null) {
                return;
            }
            openWindow({
                title: '收获地址',
                type: 2,
                content: '../shop/address.html?userId=' + id
            })
        },
        shopCart: function () {
            var id = getSelectedRow("#jqGrid");
            if (id == null) {
                return;
            }
            openWindow({
                title: '购物车',
                type: 2,
                content: '../shop/cart.html?userId=' + id
            })
        },
        getInfo: function (id) {
            Ajax.request({
                url: "/merchant/info/" + id,
                async: true,
                successCallback: function (r) {
                    vm.merchant = r.merchant;
                }
            });
        },
        /**
         * 获取会员级别
         */
        getUserLevels: function () {
            Ajax.request({
                url: "../userlevel/queryAll",
                async: true,
                successCallback: function (r) {
                    vm.userLevels = r.list;
                }
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'username': vm.q.username},
                page: page,
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