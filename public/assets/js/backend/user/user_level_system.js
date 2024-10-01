define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user_level_system/index' + location.search,
                    add_url: 'user/user_level_system/add',
                    edit_url: 'user/user_level_system/edit',
                    del_url: 'user/user_level_system/del',
                    multi_url: 'user/user_level_system/multi',
                    import_url: 'user/user_level_system/import',
                    table: 'user_level_system',
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
                        {field: 'title', title: __('Title'), operate: 'LIKE'},
                        {field: 'trade_type', title: __('Trade_type'), operate: 'LIKE'},
                        {field: 'level_key', title: __('Level_key'), operate: 'LIKE'},
                        {field: 'code', title: __('Code'), operate: 'LIKE'},
                        {field: 'account_type1', title: __('Account_type1')},
                        {field: 'price1', title: __('Price1')},
                        {field: 'account_type2', title: __('Account_type2')},
                        {field: 'price2', title: __('Price2')},
                        // {field: 'account_type3', title: __('Account_type3')},
                        {field: 'price3', title: __('Price3')},
                        {field: 'rights1', title: __('Rights1'), operate: 'LIKE'},
                        {field: 'rights2', title: __('Rights2'), operate: 'LIKE'},
                        {field: 'rights3', title: __('Rights3'), operate: 'LIKE'},
                        {field: 'rights4', title: __('Rights4'), operate: 'LIKE'},
                        {field: 'rights5', title: __('Rights5'), operate: 'LIKE'},
                        {field: 'image1', title: __('Image1'), events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'image2', title: __('Image2'), events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'image3', title: __('Image3'), events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
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
