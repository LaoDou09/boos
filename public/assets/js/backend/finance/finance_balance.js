define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_balance/index' + location.search,
                    // add_url: 'finance/finance_balance/add',
                    // edit_url: 'finance/finance_balance/edit',
                    // del_url: 'finance/finance_balance/del',
                    multi_url: 'finance/finance_balance/multi',
                    import_url: 'finance/finance_balance/import',
                    table: 'fin_balance',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'create_time',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate: 'LIKE',sortable:true},
                        {field: 'user_name', title: __('User_Name'), operate: 'LIKE',sortable:true},
                        {field: 'process_id', title: __('Process_id'), operate: 'LIKE',sortable:true},
                        // {field: 'account_id', title: __('Account_id'), operate: 'LIKE',sortable:true},
                        {field: 'account_type', title: __('Account_type'),sortable:true},
                        {field: 'account_object', title: __('Account_object'),sortable:true},

                        {field: 'balance', title: __('Balance'),sortable:true},
                        {field: 'open_balance', title: __('Open_balance'),sortable:true},
                        {field: 'occurred_amount', title: __('Occurred_amount'),sortable:true},
                        {field: 'direction', title: __('Direction'),sortable:true},
                        {field: 'close_order', title: __('Close_order'), operate: 'LIKE',sortable:true},
                        // {field: 'sign', title: __('Sign'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false,sortable:true},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false,sortable:true},
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
