@extends('layouts.master')
@section('main-content')
@section('page-css')
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/nprogress.css') }}">

    <style>
        .file-container {
            position: relative;
        }

        .input-hidden {
            display: none;
        }

        .button {
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 6px;
        }

        .button:hover {
            background-color: #2980b9;
        }
    </style>
@endsection

@if (session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        {{ session('error') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif

@if (session('import_errors'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <ul>
            @foreach (session('import_errors') as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif

@if (session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif

<div class="breadcrumb">
    <h1>{{ __('translate.Products') }}</h1>
</div>

<div class="separator-breadcrumb border-top"></div>

<div class="row" id="section_product_list">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="text-end mb-3">
                    @can('products_add')
                        <a href="/products/products/create" class=" btn btn-outline-primary btn-md m-1">
                            <i class="i-Add me-2 font-weight-bold"></i>
                            {{ __('translate.Create') }}</a>
                    @endcan
                    <a href="#" class=" btn btn-outline-primary btn-md m-1" type="button" data-toggle="modal"
                        data-target="#import_products">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-cloud-arrow-up" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M7.646 5.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708z" />
                            <path
                                d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383m.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z" />
                        </svg>
                        Import
                    </a>
                    <a class="btn btn-outline-success btn-md m-1" id="Show_Modal_Filter"><i
                            class="i-Filter-2 me-2 font-weight-bold"></i>
                        {{ __('translate.Filter') }}</a>
                </div>
                <div class="table-responsive">
                    <table id="product_table" class="display table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>{{ __('translate.Image') }}</th>
                                <th>sku code</th>
                                <th>{{ __('translate.Name') }}</th>
                                <th>Ean Code</th>
                                <th>{{ __('translate.Category') }}</th>
                                <th>{{ __('translate.Brand') }}</th>
                                <th>Buying Price</th>
                                <th>RRP</th>
                                <th>{{ __('translate.Current_Stock') }}</th>
                                <th class="not_show">{{ __('translate.Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>

                    </table>
                </div>

            </div>
        </div>
    </div>
    <!-- Modal Filter -->
    <div class="modal fade" id="filter_products_modal" tabindex="-1" role="dialog"
        aria-labelledby="filter_products_modal" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __('translate.Filter') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="POST" id="filter_products">
                        @csrf
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="code">{{ __('translate.Code_Product') }}
                                </label>
                                <input type="text" class="form-control" name="code" id="code"
                                    placeholder="{{ __('translate.Code_Product') }}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="name">{{ __('translate.Product_Name') }}
                                </label>
                                <input type="text" class="form-control" name="name" id="product_name"
                                    placeholder="{{ __('translate.Product_Name') }}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="category_id">{{ __('translate.Category') }}
                                </label>
                                <select name="category_id" id="category_id" class="form-control">
                                    <option value="0">{{ __('translate.All') }}</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="brand_id">{{ __('translate.Brand') }}
                                </label>
                                <select name="brand_id" id="brand_id" class="form-control">
                                    <option value="0">{{ __('translate.All') }}</option>
                                    @foreach ($brands as $brand)
                                        <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary">
                                    <i class="i-Filter-2 me-2 font-weight-bold"></i> {{ __('translate.Filter') }}
                                </button>
                                <button id="Clear_Form" class="btn btn-danger">
                                    <i class="i-Power-2 me-2 font-weight-bold"></i> {{ __('translate.Clear') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- Import Modal -->
    <div class="modal fade" id="import_products" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Import Products</h5>
                    <button type="button" class="close" style="background:none; border:none; font-size:16px;"
                        data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ url('products/import_products') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <ul>
                            <li><a>Click here to download sample csv file</a></li>
                        </ul>
                        <div class="file-container">
                            <h5 class="ms-2">File</h5>
                            <input type="file" name="importFile" id="fileInput" class="input-hidden"
                                onchange="displayFilePath()">
                            <button type="button" class="button btn btn-outline-primary btn-md m-1"
                                onclick="document.getElementById('fileInput').click()"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                    fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                    <path
                                        d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5" />
                                    <path
                                        d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z" />
                                </svg> Choose File</button>
                            <div class="mt-2">
                                <span id="filePath"></span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                            style="background:none; border: 1px solid gray; font-size:16px;">Cancel</button>
                        <button type="submit" class="btn btn-outline-primary btn-md m-1"
                            style=" font-size:16px;">Import</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('page-js')
<script src="{{ asset('assets/js/vendor/datatables.min.js') }}"></script>
<script src="{{ asset('assets/js/nprogress.js') }}"></script>

<script type="text/javascript">
    $(function() {
        "use strict";
        $(document).ready(function() {
            //init datatable
            product_datatable();
        });

        //Get Data
        function product_datatable(name = '', category_id = '', brand_id = '', code = '') {
            var table = $('#product_table').DataTable({
                processing: true,
                serverSide: true,
                "order": [
                    [0, "desc"]
                ],
                'columnDefs': [{
                        'targets': [0],
                        'visible': false,
                        'searchable': false,
                    },
                    {
                        'targets': [1, 2, 5, 6, 7, 8, 9, 10],
                        "orderable": false,
                    },
                ],

                ajax: {
                    url: "{{ route('products_datatable') }}",
                    data: {
                        name: name === null ? '' : name,
                        category_id: category_id == '0' ? '' : category_id,
                        brand_id: brand_id == '0' ? '' : brand_id,
                        code: code === null ? '' : code,
                        "_token": "{{ csrf_token() }}"
                    },
                    dataType: "json",
                    type: "post"
                },

                columns: [{
                        data: 'id',
                        className: "d-none"
                    },
                    {
                        data: 'image'
                    },
                    {
                        data: 'sku_code'
                    },
                    {
                        data: 'name'
                    },
                    {
                        data: 'ean_code'
                    },
                    {
                        data: 'category'
                    },
                    {
                        data: 'brand'
                    },
                    {
                        data: 'buying_price'
                    },
                    {
                        data: 'rrp'
                    },
                    {
                        data: 'quantity'
                    },
                    {
                        data: 'action'
                    },

                ],

                lengthMenu: [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                dom: "<'row'<'col-sm-12 col-md-7'lB><'col-sm-12 col-md-5 p-0'f>>rtip",
                oLanguage: {
                    sEmptyTable: "{{ __('datatable.sEmptyTable') }}",
                    sInfo: "{{ __('datatable.sInfo') }}",
                    sInfoEmpty: "{{ __('datatable.sInfoEmpty') }}",
                    sInfoFiltered: "{{ __('datatable.sInfoFiltered') }}",
                    sInfoThousands: "{{ __('datatable.sInfoThousands') }}",
                    sLengthMenu: "_MENU_",
                    sLoadingRecords: "{{ __('datatable.sLoadingRecords') }}",
                    sProcessing: "{{ __('datatable.sProcessing') }}",
                    sSearch: "",
                    sSearchPlaceholder: "{{ __('datatable.sSearchPlaceholder') }}",
                    oPaginate: {
                        sFirst: "{{ __('datatable.oPaginate.sFirst') }}",
                        sLast: "{{ __('datatable.oPaginate.sLast') }}",
                        sNext: "{{ __('datatable.oPaginate.sNext') }}",
                        sPrevious: "{{ __('datatable.oPaginate.sPrevious') }}",
                    },
                    oAria: {
                        sSortAscending: "{{ __('datatable.oAria.sSortAscending') }}",
                        sSortDescending: "{{ __('datatable.oAria.sSortDescending') }}",
                    }
                },
                buttons: [{
                    extend: 'collection',
                    text: "{{ __('translate.EXPORT') }}",
                    buttons: [{
                            extend: 'print',
                            text: 'print',
                            exportOptions: {
                                columns: ':visible:Not(.not_show)',
                                rows: ':visible'
                            },
                        },
                        {
                            extend: 'pdf',
                            text: 'pdf',
                            exportOptions: {
                                columns: ':visible:Not(.not_show)',
                                rows: ':visible'
                            },
                        },
                        {
                            extend: 'excel',
                            text: 'excel',
                            exportOptions: {
                                columns: ':visible:Not(.not_show)',
                                rows: ':visible'
                            },
                        },
                        {
                            extend: 'csv',
                            text: 'csv',
                            exportOptions: {
                                columns: ':visible:Not(.not_show)',
                                rows: ':visible'
                            },
                        },
                    ]
                }]

            });
        }

        // Clear Filter
        $('#Clear_Form').on('click', function(e) {
            var name = $('#product_name').val('');
            let category_id = $('#category_id').val('0');
            let brand_id = $('#brand_id').val('0');
            var code = $('#code').val('');

        });


        // Show Modal Filter
        $('#Show_Modal_Filter').on('click', function(e) {
            $('#filter_products_modal').modal('show');
        });


        // Submit Filter
        $('#filter_products').on('submit', function(e) {
            e.preventDefault();
            var name = $('#product_name').val();
            let category_id = $('#category_id').val();
            let brand_id = $('#brand_id').val();
            var code = $('#code').val();

            $('#product_table').DataTable().destroy();
            product_datatable(name, category_id, brand_id, code);

            $('#filter_products_modal').modal('hide');

        });

        // event reload Datatatble
        $(document).bind('event_product', function(e) {
            $('#product_table').DataTable().destroy();
            product_datatable();
        });

        //Delete Category
        $(document).on('click', '.delete', function() {
            var id = $(this).attr('id');
            app.Remove_product(id);
        });

    });
</script>

<script>
    var app = new Vue({
        el: '#section_product_list',
        data: {
            editmode: false,
            SubmitProcessing: false,
            errors: [],
            products: [],
        },

        methods: {


            //--------------------------------- Remove_product ---------------------------\\
            Remove_product(id) {

                swal({
                    title: '{{ __('translate.Are_you_sure') }}',
                    text: '{{ __('translate.You_wont_be_able_to_revert_this') }}',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#0CC27E',
                    cancelButtonColor: '#FF586B',
                    confirmButtonText: '{{ __('translate.Yes_delete_it') }}',
                    cancelButtonText: '{{ __('translate.No_cancel') }}',
                    confirmButtonClass: 'btn btn-primary me-5',
                    cancelButtonClass: 'btn btn-danger',
                    buttonsStyling: false
                }).then(function() {
                    axios
                        .delete("/products/products/" + id)
                        .then(() => {
                            $.event.trigger('event_product');
                            toastr.success('{{ __('translate.Deleted_in_successfully') }}');

                        })
                        .catch(() => {
                            toastr.error('{{ __('translate.There_was_something_wronge') }}');
                        });
                });
            },



        },
        //-----------------------------Autoload function-------------------
        created() {}

    })
</script>

<script>
    function displayFilePath() {
        const fileInput = document.getElementById('fileInput');
        const filePathSpan = document.getElementById('filePath');
        const fileName = fileInput.value.split('\\').pop(); // Extracts the file name from the file path
        filePathSpan.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
<path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
</svg> ${fileName}`;
    }
</script>
@endsection
