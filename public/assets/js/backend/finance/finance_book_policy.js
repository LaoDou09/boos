define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_book_policy/index' + location.search,
                    add_url: 'finance/finance_book_policy/add',
                    edit_url: 'finance/finance_book_policy/edit',
                    del_url: 'finance/finance_book_policy/del',
                    multi_url: 'finance/finance_book_policy/multi',
                    import_url: 'finance/finance_book_policy/import',
                    table: 'fin_book_policy',
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
                        {field: 'id', title: __('Id'), operate: 'LIKE',sortable:true},
                        {field: 'book_code', title: __('Book_code')},
                        {field: 'policy_name', title: __('Policy_name'), operate: 'LIKE'},
                        {field: 'policy_bean', title: __('Policy_bean'), operate: 'LIKE'},
                        {field: 'operators', title: __('Operators'), operate: 'LIKE'},
                        {field: 'policy_value', title: __('Policy_value'), operate: 'LIKE'},
                        {field: 'response_code', title: __('Response_code'), operate: 'LIKE'},
                        {field: 'sort', title: __('Sort'),sortable:true},
                        {field: 'status', title: __('Status'), searchList: {"2":__('Status 2')}, formatter: Table.api.formatter.status},
                        {field: 'remark', title: __('Remark'), operate: 'LIKE'},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'created_by', title: __('Created_by'), operate: 'LIKE'},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'updated_by', title: __('Updated_by'), operate: 'LIKE'},
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
