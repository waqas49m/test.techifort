@extends('layouts.master')
@section('main-content')
@section('page-css')
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/nprogress.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datepicker.min.css') }}">
    <style>
        .dimension-fields {
            display: flex;
            align-items: center;
            outline: initial !important;
            border: 1px solid #C1CDD7;
            color: #2B3445;
            background: #F4F7FB;
            border-radius: 0.375rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .rem {
            padding: 0 0px 0rem 0.75rem !important;
        }

        .dimension-fields button {
            border: none;
        }

        .dimension-fields .dropdown-menu {
            width: fit-content !important;
            left: 109px;
            min-width: fit-content;
            padding: 0px
        }

        .dimension-fields .dropdown-item {
            padding: 6px 15px;
        }

        .dimension-input {
            margin-right: 5px;
            /* Adjust the spacing between input fields */
        }

        .dimension-input input {
            background: none;
            border: none;
        }

        .dimension-separator {
            margin-right: 5px;
            /* Adjust the spacing between the text fields and the dropdown */
        }

        .dropdown {
            margin-left: 5px;
            /* Adjust the spacing between the last text field and the dropdown */
        }

        .input_in {
            width: 90%;
            border: none;
            background: none;
        }

        .input_in:focus {
            outline: none;
        }
    </style>
@endsection

<div class="breadcrumb">
    <h1>{{ __('translate.Add_Product') }}</h1>
</div>

<div class="separator-breadcrumb border-top"></div>

<!-- begin::main-row -->
<div class="row" id="section_create_product">
    <div class="col-lg-12 mb-3">

        <!--begin::form-->
        <form @submit.prevent="Create_Product()">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="name">Title<span class="field_required">*</span></label>
                            <input type="text" class="form-control" id="name"
                                placeholder="{{ __('translate.Enter_Name_Product') }}" v-model="product.name">
                            <span class="error" v-if="errors && errors.name">
                                @{{ errors.name[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">EAN code <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model.number="product.code" type="text" class="form-control"
                                        placeholder="generate the barcode" aria-label="generate the barcode"
                                        aria-describedby="basic-addon2">
                                    <!--<span class="input-group-text cursor-pointer" id="basic-addon2"
                                    @click="generateNumber()"><i class="i-Bar-Code"></i></span> -->
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.code">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">SKU code <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model="product.ean_code" type="text" class="form-control"
                                        placeholder="EAN Code" aria-label="ean code" aria-describedby="basic-addon2">
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.ean_code">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label>{{ __('translate.Category') }} <span class="field_required">*</span></label>
                            <v-select placeholder="{{ __('translate.Choose_Category') }}" v-model="product.category_id"
                                :reduce="(option) => option.value"
                                :options="categories.map(categories => ({ label: categories.name, value: categories.id }))">
                            </v-select>

                            <span class="error" v-if="errors && errors.category_id">
                                @{{ errors.category_id[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label>{{ __('translate.Brand') }}</label>
                            <v-select placeholder="{{ __('translate.Choose_Brand') }}" v-model="product.brand_id"
                                :reduce="(option) => option.value"
                                :options="brands.map(brands => ({ label: brands.name, value: brands.id }))">
                            </v-select>
                        </div>

                        <div class="form-group col-md-4">
                            <label>Batch Code</label>
                            <div class="input-group mb-3">
                                <input v-model="product.batch_code" type="text" class="form-control"
                                    aria-describedby="basic-addon3">
                            </div>
                            <span class="error" v-if="errors && errors.batch_code">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label>{{ __('translate.Unit_Product') }} <span class="field_required">*</span></label>
                            <v-select @input="Selected_Unit" placeholder="{{ __('translate.Choose_Unit_Product') }}"
                                v-model="product.unit_id" :reduce="label => label.value"
                                :options="units.map(units => ({ label: units.name, value: units.id }))">
                            </v-select>

                            <span class="error" v-if="errors && errors.unit_id">
                                @{{ errors.unit_id[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">Product Weight (gm) <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3 dimension-fields">
                                    <input style="border:none !important;" v-model.number="product.weight"
                                        type="text" class="form-control" placeholder="Product Weight"
                                        aria-label="Product Weight">
                                    <div class="btn-group">
                                        <button type="button" id="dropdownButton"
                                            class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            gm
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right border-0"
                                            style="width: fit-content;">
                                            <button class="dropdown-item" type="button" onclick="selectOption('gm')"
                                                style="width: fit-content;">gm</button>
                                            <button class="dropdown-item" type="button" onclick="selectOption('ml')"
                                                style="width: fit-content;">ml</button>
                                            <button class="dropdown-item" type="button" onclick="selectOption('oz')"
                                                style="width: fit-content;">oz</button>
                                        </div>
                                    </div>
                                </div>
                                <span class="error" v-if="errors && errors.weight">
                                    @{{ errors.code[0] }}
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">Dimensions (Length X Width X Height) <span
                                    class="field_required">*</span></label>
                            <div class="dimension-fields"><span class="dimension-input"><input
                                        v-model="product.length" id="ember731"
                                        class="ember-text-field text-right ember-view form-control"
                                        type="text"></span> <span class="dimension-seperator">x</span> <span
                                    class="dimension-input"><input v-model="product.width" id="ember732"
                                        class="ember-text-field text-right ember-view form-control"
                                        type="text"></span> <span class="dimension-seperator">x</span> <span
                                    class="dimension-input"><input v-model="product.height" id="ember733"
                                        class="ember-text-field text-right ember-view form-control"
                                        type="text"></span>
                                <div class="btn-group">
                                    <button type="button" id="dropdownButton2"
                                        class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        in
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right border-0"
                                        style="width: fit-content;">
                                        <button class="dropdown-item item-focus" type="button"
                                            onclick="selectOption2('in')" data-ember-action=""
                                            data-ember-action-737="737" style="width: fit-content;">in</button>
                                        <button class="dropdown-item" type="button" data-ember-action=""
                                            onclick="selectOption2('cm')" data-ember-action-736="736"
                                            style="width: fit-content;">cm</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">CPNP (UK/Europe) <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model="product.cpnp" type="text" class="form-control"
                                        placeholder="CPNP" aria-label="Product Weight">
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.cpnp">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">Production place <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model.number="product.product_place" type="text" class="form-control"
                                        placeholder="Production Place" aria-label="Product Weight">
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.product_place">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="image">{{ __('translate.Product_Artwork') }} </label>
                            <input name="product_artwork" @change="onFileSelected" type="file"
                                class="form-control" id="image">
                            <span class="error" v-if="errors && errors.product_artwork">
                                @{{ errors.image[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="image">{{ __('translate.Main_Image') }} </label>
                            <input name="image" @change="onFileSelected" type="file" class="form-control"
                                id="image">
                            <span class="error" v-if="errors && errors.image">
                                @{{ errors.image[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-12 mb-4">
                            <label for="note">{{ __('translate.Please_provide_any_details') }} </label>
                            <textarea type="text" v-model="product.note" class="form-control" name="note" id="note"
                                placeholder="{{ __('translate.Please_provide_any_details') }}"></textarea>
                        </div>

                        <div class="form-group col-md-12 mb-4">
                            <label for="note">Ingredients</label>
                            <textarea type="text" v-model="product.ingredients" class="form-control" name="ingredients"
                                placeholder="Ingredients"></textarea>
                        </div>

                        <div class="form-group col-md-12 mb-4">
                            <label for="note">Usage</label>
                            <textarea type="text" v-model="product.product_usage" class="form-control" name="usage" placeholder="Usage"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-5">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="cost">Buying Price <span class="field_required">*</span></label>
                            <input type="text" class="form-control" placeholder="Buying"
                                v-model="product.buying_price">
                            <span class="error" v-if="errors && errors.buying_price">
                                @{{ errors.cost[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="cost">Composition <span class="field_required">*</span></label>
                            <input type="text" class="form-control" placeholder="composition"
                                v-model="product.composition">
                            <span class="error" v-if="errors && errors.composition">
                                @{{ errors.cost[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="price">Commudity code/HS code<span class="field_required">*</span></label>
                            <input type="text" class="form-control" placeholder="HS Code"
                                v-model="product.community_code">
                            <span class="error" v-if="errors && errors.community_code">
                                @{{ errors.price[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="price">Expiry Date<span class="field_required">*</span></label>
                            <input type="date" class="form-control" placeholder="Expiry Date"
                                v-model="product.expiry_date">
                            <span class="error" v-if="errors && errors.expiry_date">
                                @{{ errors.price[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="price">Unit price<span class="field_required">*</span></label>
                            <input type="text" class="form-control" placeholder="Unit Price"
                                v-model="product.unit_price">
                            <span class="error" v-if="errors && errors.unit_price">
                                @{{ errors.price[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="price">RRP (GBP)<span class="field_required">*</span></label>
                            <div class="form-control dimension-fields rem">
                                <input type="text" id="price" class="input_in" placeholder="Ex. 10"
                                    v-model="product.rrp">
                                    <div class="btn-group">
                                        <button type="button" id="dropdownButton3" class="btn btn-secondary dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            GBP
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right border-0"
                                            style="width: fit-content;">
                                            <button class="dropdown-item ac-option" type="button" onclick="selectOption3('EUR')"
                                                style="width: fit-content;" data-currency="EUR">EUR</button>
                                            <button class="dropdown-item ac-option item-focus" type="button" onclick="selectOption3('USD')"
                                                style="width: fit-content;" data-currency="USD">USD</button>
                                        </div>
                                    </div>
                            </div>
                            <span class="error" v-if="errors && errors.rrp">
                                @{{ errors.price[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="stock_alert">{{ __('translate.Stock_Alert') }} </label>
                            <input type="text" class="form-control" id="stock_alert"
                                placeholder="{{ __('translate.Enter_Stock_alert') }}" v-model="product.stock_alert">
                        </div>

                        {{-- <div class="form-group col-md-4" v-if="product.type != 'is_service'">
                            <label>{{ __('translate.Unit_Product') }} <span class="field_required">*</span></label>
                            <v-select @input="Selected_Unit" placeholder="{{ __('translate.Choose_Unit_Product') }}"
                                v-model="product.unit_id" :reduce="label => label.value"
                                :options="units.map(units => ({ label: units.name, value: units.id }))">
                            </v-select>

                            <span class="error" v-if="errors && errors.unit_id">
                                @{{ errors.unit_id[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4" v-if="product.type != 'is_service'">
                            <label>{{ __('translate.Unit_Sale') }} <span class="field_required">*</span></label>
                            <v-select placeholder="{{ __('translate.Choose_Unit_Sale') }}"
                                v-model="product.unit_sale_id" :reduce="label => label.value"
                                :options="units_sub.map(units_sub => ({ label: units_sub.name, value: units_sub.id }))">
                            </v-select>

                            <span class="error" v-if="errors && errors.unit_sale_id">
                                @{{ errors.unit_sale_id[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4" v-if="product.type != 'is_service'">
                            <label>{{ __('translate.Unit_Purchase') }} <span class="field_required">*</span></label>
                            <v-select placeholder="{{ __('translate.Choose_Unit_Purchase') }}"
                                v-model="product.unit_purchase_id" :reduce="label => label.value"
                                :options="units_sub.map(units_sub => ({ label: units_sub.name, value: units_sub.id }))">
                            </v-select>

                            <span class="error" v-if="errors && errors.unit_purchase_id">
                                @{{ errors.unit_purchase_id[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4" v-if="product.type != 'is_service'">
                            <label for="qty_min">{{ __('translate.Minimum_sale_quantity') }} </label>
                            <input type="text" class="form-control" id="qty_min"
                                placeholder="{{ __('translate.Enter_Minimum_sale_quantity') }}"
                                v-model="product.qty_min">
                        </div>

                        <div class="form-group col-md-4" v-if="product.type != 'is_service'">
                            <label for="stock_alert">{{ __('translate.Stock_Alert') }} </label>
                            <input type="text" class="form-control" id="stock_alert"
                                placeholder="{{ __('translate.Enter_Stock_alert') }}" v-model="product.stock_alert">
                        </div>

                        <div class="col-md-9 mb-3 mt-3" v-if="product.type == 'is_variant'">
                            <div class="d-flex">
                                <input placeholder="Enter the Variant" type="text" name="variant" v-model="tag"
                                    class="form-control">
                                <a @click="add_variant(tag)" class=" ms-3 btn btn-md btn-primary">
                                    {{ __('translate.Add') }}
                                </a>
                            </div>
                        </div>

                        <div class="col-md-9 mb-2 " v-if="product.type == 'is_variant'">
                            <div class="table-responsive">
                                <table class="table table-hover table-sm">
                                    <thead class="bg-gray-300">
                                        <tr>
                                            <th scope="col">{{ __('translate.Variant_code') }}</th>
                                            <th scope="col">{{ __('translate.Variant_Name') }}</th>
                                            <th scope="col">{{ __('translate.Product_Cost') }}</th>
                                            <th scope="col">{{ __('translate.Product_Price') }}</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-if="variants.length <=0">
                                            <td colspan="3">{{ __('translate.No_data_Available') }}</td>
                                        </tr>
                                        <tr v-for="variant in variants">
                                            <td>
                                                <input required class="form-control" v-model="variant.code">
                                            </td>
                                            <td>
                                                <input required class="form-control" v-model="variant.text">
                                            </td>
                                            <td>
                                                <input required class="form-control" v-model="variant.cost">
                                            </td>
                                            <td>
                                                <input required class="form-control" v-model="variant.price">
                                            </td>
                                            <td>
                                                <a @click="delete_variant(variant.var_id)" class="btn btn-danger"
                                                    title="Delete">
                                                    <i class="i-Close-Window"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div> --}}
                    </div>
                </div>
            </div>

            {{-- <div class="card mt-5">
                <div class="card-body">

                    <!-- Product_Has_Imei_Serial_number -->
                    <div class="col-md-12 mb-2">
                        <div class="form-check form-check-inline">
                            <label class="checkbox checkbox-primary" for="is_imei">
                                <input type="checkbox" id="is_imei" v-model="product.is_imei">
                                <span>{{ __('translate.Product_Has_Imei/Serial_number') }}</span><span
                                    class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div> --}}

            <div class="row mt-3">
                <div class="col-lg-6">
                    <button type="submit" class="btn btn-primary" :disabled="SubmitProcessing">
                        <span v-if="SubmitProcessing" class="spinner-border spinner-border-sm" role="status"
                            aria-hidden="true"></span> <i class="i-Yes me-2 font-weight-bold"></i>
                        {{ __('translate.submit') }}
                    </button>
                </div>
            </div>
        </form>

        <!-- end::form -->
    </div>

</div>
@endsection

@section('page-js')
<script src="{{ asset('assets/js/nprogress.js') }}"></script>
<script src="{{ asset('assets/js/bootstrap-tagsinput.js') }}"></script>
<script src="{{ asset('assets/js/datepicker.min.js') }}"></script>
<script src="{{ asset('assets/js/vendor/vuejs-datepicker/vuejs-datepicker.min.js') }}"></script>


<script>
    $(document).ready(function() {
        $('.ac-option').on('click', function() {
            var selectedCurrency = $(this).data('currency');
            console.log(selectedCurrency);
            var currentPrice = document.getElementById('price').value;
            console.log(currentPrice);
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: '/products/convert-currency',
                method: 'POST',
                data: {
                    currency: selectedCurrency,
                    current_value: currentPrice,
                    _token: csrfToken
                },
                success: function(response) {
                    console.log(response);
                    $('#price').val(parseFloat(response).toFixed(2));
                },
                error: function(error) {
                    console.error('Error fetching currency conversion data:', error);
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(function() {
        "use strict";

        $(document).on('keyup keypress', 'form input[type="text"]', function(e) {
            if (e.keyCode == 13) {
                e.preventDefault();
                return false;
            }
        });

    });
</script>

<script>
    Vue.component('v-select', VueSelect.VueSelect)

    var app = new Vue({
        el: '#section_create_product',
        components: {
            vuejsDatepicker,
        },
        data: {
            tag: "",
            len: 8,
            SubmitProcessing: false,
            data: new FormData(),
            errors: [],
            categories: @json($categories),
            units: @json($units),
            units_sub: [],
            brands: @json($brands),
            variants: [],
            product: {
                name: "",
                ean_code: "",
                code: "",
                Type_barcode: "",
                batch_code: "",
                weight: "",
                length: "",
                width: "",
                height: "",
                cpnp: "",
                product_place: "",
                buying_price: "",
                product_usage: "",
                ingredients: "",
                composition: "",
                community_code: "",
                unit_price: "",
                rrp: "",
                brand_id: "",
                category_id: "",
                unit_id: "",
                stock_alert: "0",
                qty_min: 0,
                image: "",
                product_artwork: "",
                note: ""
            },
        },



        methods: {

            //------ Generate code
            generateNumber() {
                this.code_exist = "";
                this.product.code = Math.floor(
                    Math.pow(10, this.len - 1) +
                    Math.random() *
                    (Math.pow(10, this.len) - Math.pow(10, this.len - 1) - 1)
                );
            },

            add_variant(tag) {
                if (
                    this.variants.length > 0 &&
                    this.variants.some(variant => variant.text === tag)
                ) {
                    toastr.error('Variant Duplicate');
                } else {
                    if (this.tag != '') {
                        var variant_tag = {
                            var_id: this.variants.length + 1, // generate unique ID
                            text: tag
                        };
                        this.variants.push(variant_tag);
                        this.tag = "";
                    } else {

                        toastr.error('Please Enter the Variant');

                    }
                }
            },


            //-----------------------------------Delete variant------------------------------\\
            delete_variant(var_id) {

                for (var i = 0; i < this.variants.length; i++) {
                    if (var_id === this.variants[i].var_id) {
                        this.variants.splice(i, 1);
                    }
                }
            },


            formatDate(d) {
                var m1 = d.getMonth() + 1;
                var m2 = m1 < 10 ? '0' + m1 : m1;
                var d1 = d.getDate();
                var d2 = d1 < 10 ? '0' + d1 : d1;
                return [d.getFullYear(), m2, d2].join('-');
            },

            //---Validate State Fields
            getValidationState({
                dirty,
                validated,
                valid = null
            }) {
                return dirty || validated ? valid : null;
            },


            onFileSelected(e) {
                let file = e.target.files[0];
                this.product.image = file;
            },

            //---------------------- Get Sub Units with Unit id ------------------------------\\
            Get_Units_SubBase(value) {
                axios
                    .get("/products/Get_Units_SubBase?id=" + value)
                    .then(({
                        data
                    }) => (this.units_sub = data));
            },


            //---------------------- Event Select Unit Product ------------------------------\\
            Selected_Unit(value) {
                this.units_sub = [];
                this.product.unit_sale_id = "";
                this.product.unit_purchase_id = "";
                this.Get_Units_SubBase(value);
            },


            //------------------------------ Create new Product ------------------------------\\
            Create_Product() {

                if (this.product.type == 'is_variant' && this.variants.length <= 0) {
                    toastr.error('The variants array is required.');
                } else {

                    NProgress.start();
                    NProgress.set(0.1);
                    var self = this;
                    self.SubmitProcessing = true;

                    if (self.product.type == 'is_variant' && self.variants.length > 0) {
                        self.product.is_variant = true;
                    } else {
                        self.product.is_variant = false;
                    }


                    // append objet product
                    Object.entries(self.product).forEach(([key, value]) => {
                        self.data.append(key, value);
                    });


                    // append array variants
                    if (self.variants.length) {
                        self.data.append("variants", JSON.stringify(self.variants));
                    }

                    // Send Data with axios
                    axios
                        .post("/products/products", self.data)
                        .then(response => {
                            NProgress.done();
                            self.SubmitProcessing = false;
                            window.location.href = '/products/products';
                            toastr.success('{{ __('translate.Created_in_successfully') }}');
                            self.errors = {};
                        })
                        .catch(error => {
                            NProgress.done();
                            self.SubmitProcessing = false;

                            if (error.response.status == 422) {
                                self.errors = error.response.data.errors;
                                console.log(error.response.data.errors);
                                toastr.error('{{ __('translate.There_was_something_wronge') }}');
                            }

                            if (self.errors.variants && self.errors.variants.length > 0) {
                                toastr.error(self.errors.variants[0]);
                            }
                        });
                }
            }


        },
        //-----------------------------Autoload function-------------------
        created() {}

    })
</script>

<script>
    function selectOption(value) {
        var dropdownButton = document.getElementById('dropdownButton');
        dropdownButton.textContent = value;
    }

    function selectOption2(value) {
        var dropdownButton2 = document.getElementById('dropdownButton2');
        dropdownButton2.textContent = value;
    }

    function selectOption3(value) {
        var dropdownButton3 = document.getElementById('dropdownButton3');
        dropdownButton3.textContent = value;
    }
</script>
@endsection
