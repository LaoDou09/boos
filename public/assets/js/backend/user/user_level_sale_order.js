define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_level_sale_order/index' + location.search,
                    // add_url: 'user/user_level_sale_order/add',
                    // edit_url: 'user/user_level_sale_order/edit',
                    // del_url: 'user/user_level_sale_order/del',
                    multi_url: 'user/user_level_sale_order/multi',
                    import_url: 'user/user_level_sale_order/import',
                    table: 'user_level_sale_order',
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
                        {field: 'title', title: __('Title'), operate: 'LIKE'},
                        {field: 'user_id', title: __('User_id'), operate: 'LIKE'},
                        {field: 'user_name', title: __('手机号'), operate: 'LIKE'},
                        // {field: 'login_name', title: __('Login_name'), operate: 'LIKE'},
                        {field: 'trade_type', title: __('Trade_type'), operate: 'LIKE'},
                        {field: 'level_key', title: __('Level_key'), operate: 'LIKE'},
                        {field: 'code', title: __('Code'), operate: 'LIKE'},
                        {field: 'account_type1', title: __('Account_type1')},
                        {field: 'price1', title: __('Price1')},
                        {field: 'account_type2', title: __('Account_type2')},
                        {field: 'price2', title: __('Price2')},
                        {field: 'account_type3', title: __('Account_type3')},
                        {field: 'price3', title: __('Price3')},
                        {field: 'promotion_code', title: __('Promotion_code'), operate: 'LIKE'},
                        {field: 'promotion_user_id', title: __('Promotion_user_id'), operate: 'LIKE'},
                        {field: 'promotion_login_name', title: __('Promotion_login_name'), operate: 'LIKE'},
                        // {field: 'expire_time', title: __('Expire_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'status', title: __('Status'), searchList: {"2":__('Status 2')}, formatter: Table.api.formatter.status},

                        // {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        // add: function () {
        //     Controller.api.bindevent();
        // },
        // edit: function () {
        //     Controller.api.bindevent();
        // },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
