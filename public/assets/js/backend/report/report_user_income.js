define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'report/report_user_income/index' + location.search,
                    add_url: 'report/report_user_income/add',
                    edit_url: 'report/report_user_income/edit',
                    del_url: 'report/report_user_income/del',
                    multi_url: 'report/report_user_income/multi',
                    import_url: 'report/report_user_income/import',
                    table: 'report_user_income',
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
                        {field: 'id', title: __('Id'), operate: 'LIKE'},
                        {field: 'user_id', title: __('User_id'), operate: 'LIKE'},
                        {field: 'user_name', title: __('User_name'), operate: 'LIKE'},
                        {field: 'promotion', title: __('Promotion')},
                        {field: 'blind', title: __('Blind')},
                        {field: 'profit', title: __('Profit')},
                        {field: 'limit', title: __('Limit')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
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
