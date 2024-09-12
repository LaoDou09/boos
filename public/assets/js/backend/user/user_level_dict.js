define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_level_dict/index' + location.search,
                    add_url: 'user/user_level_dict/add',
                    edit_url: 'user/user_level_dict/edit',
                    del_url: 'user/user_level_dict/del',
                    multi_url: 'user/user_level_dict/multi',
                    import_url: 'user/user_level_dict/import',
                    table: 'user_level_dict',
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
                        {field: 'name', title: __('Name'), operate: 'LIKE',sortable:true},
                        {field: 'level_key', title: __('Level_key'), operate: 'LIKE',sortable:true},
                        {field: 'code', title: __('Code'), operate: 'LIKE',sortable:true},
                        {field: 'promotion_reward', title: __('Promotion_reward'), operate: 'LIKE'},
                        {field: 'service_reward', title: __('Service_reward'), operate: 'LIKE'},
                        {field: 'coupon_release', title: __('Coupon_release'), operate: 'LIKE'},
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
