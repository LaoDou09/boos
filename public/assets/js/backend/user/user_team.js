define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_team/index' + location.search,
                    add_url: 'user/user_team/add',
                    edit_url: 'user/user_team/edit',
                    del_url: 'user/user_team/del',
                    multi_url: 'user/user_team/multi',
                    import_url: 'user/user_team/import',
                    table: 'user_team',
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
                        {field: 'parent1', title: __('Parent1'), operate: 'LIKE'},
                        {field: 'parent2', title: __('Parent2'), operate: 'LIKE'},
                        {field: 'parent3', title: __('Parent3'), operate: 'LIKE'},
                        {field: 'parent4', title: __('Parent4'), operate: 'LIKE'},
                        {field: 'parent5', title: __('Parent5'), operate: 'LIKE'},
                        {field: 'agent1', title: __('Agent1'), operate: 'LIKE'},
                        {field: 'agent2', title: __('Agent2'), operate: 'LIKE'},
                        {field: 'agent3', title: __('Agent3'), operate: 'LIKE'},
                        {field: 'agent4', title: __('Agent4'), operate: 'LIKE'},
                        {field: 'agent5', title: __('Agent5'), operate: 'LIKE'},
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
