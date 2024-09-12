define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_info/index' + location.search,
                    // add_url: 'user/user_info/add',
                    edit_url: 'user/user_info/edit',
                    // del_url: 'user/user_info/del',
                    multi_url: 'user/user_info/multi',
                    import_url: 'user/user_info/import',
                    table: 'user_info',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'),sortable:true},
                        {field: 'user_id', title: __('User_id'), operate: 'LIKE',sortable:true},
                        {field: 'user_name', title: __('User_name'), operate: 'LIKE',sortable:true},
                        {field: 'login_name', title: __('Login_name'), operate: 'LIKE',sortable:true},
                        {field: 'user_type', title: __('User_type'), operate: 'LIKE',sortable:true},
                        // {field: 'pay_passwd', title: __('Pay_passwd'), operate: 'LIKE'},
                        {field: 'tariff_code', title: __('Tariff_code'), operate: 'LIKE',sortable:true},
                        {field: 'user_level', title: __('User_level'), operate: 'LIKE',sortable:true},
                        {field: 'agent_level', title: __('Agent_level'), operate: 'LIKE',sortable:true},
                        {field: 'sys_level', title: __('Sys_level'), operate: 'LIKE',sortable:true},
                        {field: 'cash_status', title: __('Cash_status'), operate: 'LIKE', formatter: Table.api.formatter.status,sortable:true},
                        // {field: 'token', title: __('Token'), operate: 'LIKE'},
                        {field: 'cash_code', title: __('Cash_code'), operate: 'LIKE'},
                        {field: 'promotion_code', title: __('Promotion_code'), operate: 'LIKE'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        // add: function () {
        //     Controller.api.bindevent();
        // },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
