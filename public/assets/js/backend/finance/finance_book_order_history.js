define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_book_order_history/index' + location.search,
                    // add_url: 'finance/finance_book_order_history/add',
                    // edit_url: 'finance/finance_book_order_history/edit',
                    // del_url: 'finance/finance_book_order_history/del',
                    multi_url: 'finance/finance_book_order_history/multi',
                    import_url: 'finance/finance_book_order_history/import',
                    table: 'fin_book_order_history',
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
                        {field: 'book_title', title: __('Book_title'), operate: 'LIKE'},
                        // {field: 'account_id', title: __('Account_id'), operate: 'LIKE'},
                        {field: 'batch_id', title: __('Batch_id'), operate: 'LIKE'},
                        {field: 'batch_detail_id', title: __('Batch_detail_id'), operate: 'LIKE'},
                        {field: 'book_code', title: __('Book_code')},
                        {field: 'account_type', title: __('Account_type')},
                        {field: 'account_object', title: __('Account_object')},
                        {field: 'book_category', title: __('Book_category')},
                        {field: 'user_name', title: __('User_Name')},
                        {field: 'process_id', title: __('Process_id'), operate: 'LIKE'},
                        {field: 'debit_amount', title: __('Debit_amount')},
                        {field: 'credit_amount', title: __('Credit_amount')},
                        {field: 'direction', title: __('Direction'), operate: 'LIKE'},
                        {field: 'remark', title: __('Remark'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        // {field: 'sign', title: __('Sign'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
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
