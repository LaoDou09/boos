define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_book_template/index' + location.search,
                    add_url: 'finance/finance_book_template/add',
                    edit_url: 'finance/finance_book_template/edit',
                    del_url: 'finance/finance_book_template/del',
                    multi_url: 'finance/finance_book_template/multi',
                    import_url: 'finance/finance_book_template/import',
                    table: 'fin_book_template',
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
                        {field: 'book_title', title: __('Book_title'), operate: 'LIKE'},
                        {field: 'book_code', title: __('Book_code')},
                        // {field: 'account_bean', title: __('Account_bean'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'batch_detail_id', title: __('Batch_detail_id'), operate: 'LIKE',sortable:true},
                        {field: 'book_bean', title: __('Book_bean'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'process_id', title: __('Process_id'), operate: 'LIKE'},
                        {field: 'process_bean', title: __('Process_bean'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'account_type', title: __('Account_type'),formatter: Table.api.formatter.label, searchList: Config.model_options.account_type},
                        {field: 'account_object', title: __('Account_object'),formatter: Table.api.formatter.label, searchList: Config.model_options.account_object},
                        {field: 'book_category', title: __('Book_category'),formatter: Table.api.formatter.label, searchList: Config.model_options.book_category},
                        {field: 'debit_amount', title: __('Debit_amount')},
                        {field: 'credit_amount', title: __('Credit_amount')},
                        {field: 'debit_amount_bean', title: __('Debit_amount_bean'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'credit_amount_bean', title: __('Credit_amount_bean'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'direction', title: __('Direction'), operate: 'LIKE',formatter: Table.api.formatter.label, searchList: Config.model_options.direction},
                        {field: 'remark', title: __('Remark'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false,sortable:true},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'create_by', title: __('Create_by'), operate: 'LIKE'},
                        {field: 'update_by', title: __('Update_by'), operate: 'LIKE'},
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
