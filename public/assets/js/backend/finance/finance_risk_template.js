define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_risk_template/index' + location.search,
                    add_url: 'finance/finance_risk_template/add',
                    edit_url: 'finance/finance_risk_template/edit',
                    del_url: 'finance/finance_risk_template/del',
                    multi_url: 'finance/finance_risk_template/multi',
                    import_url: 'finance/finance_risk_template/import',
                    table: 'fin_risk_template',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate: 'LIKE',sortable:true},
                        {field: 'title', title: __('Title'), operate: 'LIKE'},
                        {field: 'risk_bean', title: __('Risk_bean'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'book_code', title: __('Book_code')},
                        {field: 'operators', title: __('Operators'), operate: 'LIKE'},
                        {field: 'value', title: __('Value'), operate: 'LIKE'},
                        {field: 'sort', title: __('Sort'),sortable:true},
                        {field: 'status', title: __('Status'), searchList: {"2":__('Status 2')}, formatter: Table.api.formatter.status},
                        {field: 'remark', title: __('Remark'), operate: 'LIKE'},
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
