define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_cash_policy/index' + location.search,
                    add_url: 'finance/finance_cash_policy/add',
                    edit_url: 'finance/finance_cash_policy/edit',
                    del_url: 'finance/finance_cash_policy/del',
                    multi_url: 'finance/finance_cash_policy/multi',
                    import_url: 'finance/finance_cash_policy/import',
                    table: 'fin_cash_policy',
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
                        {field: 'policy_name', title: __('Policy_name'), operate: 'LIKE'},
                        {field: 'trade_type', title: __('Trade_type'), operate: 'LIKE'},
                        {field: 'bean_type', title: __('Bean_type'), operate: 'LIKE'},
                        {field: 'bean_name', title: __('Bean_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'sort', title: __('Sort')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false,sortable:true},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
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
