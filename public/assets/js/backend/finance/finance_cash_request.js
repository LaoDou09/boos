define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/finance_cash_request/index' + location.search,
                    add_url: 'finance/finance_cash_request/add',
                    edit_url: 'finance/finance_cash_request/edit',
                    del_url: 'finance/finance_cash_request/del',
                    multi_url: 'finance/finance_cash_request/multi',
                    import_url: 'finance/finance_cash_request/import',
                    book_url: 'finance/finance_cash_request/book',
                    table: 'fin_cash_request',
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
                        {field: 'user_id', title: __('User_id'), operate: 'LIKE'},
                        // {field: 'user_mobile', title: __('User_mobile'), operate: 'LIKE'},
                        {field: 'user_name', title: __('手机号'), operate: 'LIKE'},
                        {field: 'trade_type', title: __('Trade_type'), operate: 'LIKE'},
                        // {field: 'book_code', title: __('Book_code')},
                        {field: 'amount', title: __('Amount')},
                        {field: 'to_user_id', title: __('To_user_id'), operate: 'LIKE'},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false,sortable:true},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'create_by', title: __('Create_by'), operate: 'LIKE'},
                        {field: 'update_by', title: __('Update_by'), operate: 'LIKE'},
                        {field: 'remark', title: __('Remark'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'status', title: __('Status'), searchList: {"2":__('Status 2')}, formatter: Table.api.formatter.status},

                        {
                            field: 'operate', title: __('Operate'), 
                            table: table, 
                            buttons: [
                                {
                                    name: 'book',
                                    text: '记账',
                                    icon: 'fa fa-gavel',
                                    title: '记账',
                                    classname: 'btn btn-info btn-xs btn-ajax btn-custom',
                                    url: $.fn.bootstrapTable.defaults.extend.book_url,
                                    confirm:'确定要记账?',
                                    success:function () {
                                        $(".btn-refresh").trigger("click");
                                    }
                                },
                            ],
                            events: Table.api.events.operate, 
                            formatter: Table.api.formatter.operate
                        }
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
