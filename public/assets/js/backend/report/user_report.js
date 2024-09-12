define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'report/user_report/index' + location.search,
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
                commonSearch:false,
                showExport:false,
                showColumns:false,
                showToggle:false,
                // search:false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'user_id', title: __('用户ID'),sortable:true,searchable:false},
                        {field: 'user_name', title: __('手机号'),sortable:true,searchable:false},
                        {field: 'user_level', title: __('用户等级'),searchable:false},
                        {field: 'agent_level', title: __('代理等级'),searchable:false},
                        
                        {field: 'u1010', title: __('U1010'),searchable:false},
                        {field: 'u1020', title: __('U1020'),searchable:false},
                        {field: 'u1030', title: __('U1030'),searchable:false},
                        {field: 'kpi_today', title: __('本日业绩'),searchable:false},
                        {field: 'kpi_month', title: __('本月业绩'),searchable:false},
                        {field: 'kpi_all', title: __('总业绩'),searchable:false},

                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
