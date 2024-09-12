define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_release_coupon/index' + location.search,
                    // add_url: 'user/user_release_coupon/add',
                    // edit_url: 'user/user_release_coupon/edit',
                    // del_url: 'user/user_release_coupon/del',
                    multi_url: 'user/user_release_coupon/multi',
                    import_url: 'user/user_release_coupon/import',
                    table: 'user_release_coupon',
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
                        {field: 'release', title: __('Release')},
                        {field: 'freeze', title: __('Freeze')},
                        {field: 'finish', title: __('Finish')},
                        {field: 'release_times', title: __('Release_times')},
                        {field: 'u1010', title: __('U1010')},
                        {field: 'u1020', title: __('U1020')},
                        {field: 'u1030', title: __('U1030')},
                        {field: 'next_date', title: __('Next_date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'sum_coupon', title: __('Sum_coupon')}

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
