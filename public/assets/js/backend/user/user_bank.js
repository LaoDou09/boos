define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_bank/index' + location.search,
                    add_url: 'user/user_bank/add',
                    edit_url: 'user/user_bank/edit',
                    del_url: 'user/user_bank/del',
                    multi_url: 'user/user_bank/multi',
                    import_url: 'user/user_bank/import',
                    table: 'user_bank',
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
                        {field: 'id', title: __('Id'), operate: 'LIKE'},
                        {field: 'user_id', title: __('User_id'), operate: 'LIKE'},
                        {field: 'user_name', title: __('User_name'), operate: 'LIKE'},
                        {field: 'login_name', title: __('Login_name'), operate: 'LIKE'},
                        {field: 'account_no', title: __('Account_no'), operate: 'LIKE'},
                        {field: 'account_name', title: __('Account_name'), operate: 'LIKE'},
                        {field: 'bank_reserved_mobile', title: __('Bank_reserved_mobile'), operate: 'LIKE'},
                        {field: 'open_bank_name', title: __('Open_bank_name'), operate: 'LIKE'},
                        {field: 'bank_line_name', title: __('Bank_line_name'), operate: 'LIKE'},
                        {field: 'bank_code', title: __('Bank_code'), operate: 'LIKE'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
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
