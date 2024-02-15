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
        
        svg.icon.fill-azure-blue {
    fill: blue!important;
}
svg.icon.icon-sm, .sms-custom-editor svg.icon.sms-info {
    height: 14px;
    width: 14px;
}

svg.icon.icon-picture {
    height: 32px;
    width: 32px;
    fill: lightgray
}

.deleteButton{
    border:none;
    background:transparent;
    
}
.deleteButton svg{
    height: 14px;
    width: 14px;
    fill: lightgray
}
    </style>
@endsection

<div class="breadcrumb">
    <h1>{{ __('translate.Add_Product_Kit') }}</h1>
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
                            <label for="code">Product SKU <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model.number="product.code" type="text" class="form-control"
                                        placeholder="generate the barcode" aria-label="generate the barcode"
                                        aria-describedby="basic-addon2">
                                    <span class="input-group-text cursor-pointer" id="basic-addon2"
                                        @click="generateNumber()"><i class="i-Bar-Code"></i></span>
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.code">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">EAN code <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model.number="product.ean" type="text" class="form-control"
                                        placeholder="EAN Code" aria-label="ean code" aria-describedby="basic-addon2">
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.ean">
                                @{{ errors.code[0] }}
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
                                <input v-model.number="product.batch" type="text" class="form-control"
                                    aria-describedby="basic-addon3">
                            </div>
                            <span class="error" v-if="errors && errors.batch">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4 ">
                            <label for="code">Product Weight (gm) <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3 dimension-fields">
                                    <input style="border:none !important;" v-model.number="product.weight" type="text" class="form-control"
                                        placeholder="Product Weight" aria-label="Product Weight">
                                        <div class="btn-group">
                                    <button type="button" class="btn btn-secondary dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        gm
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right border-0"
                                        style="width: fit-content;">
                                        <button class="dropdown-item ac-option" type="button"
                                            style="width: fit-content;" data-currency="EUR">gm</button>
                                        <button class="dropdown-item ac-option item-focus" type="button"
                                            style="width: fit-content;" data-currency="USD">ml</button>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.weight">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">Dimensions (Length X Width X Height) <span
                                    class="field_required">*</span></label>

                            <div class="dimension-fields"><span class="dimension-input"><input id="ember731"
                                        class="ember-text-field text-right ember-view form-control"
                                        type="text"></span> <span class="dimension-seperator">x</span> <span
                                    class="dimension-input"><input id="ember732"
                                        class="ember-text-field text-right ember-view form-control"
                                        type="text"></span> <span class="dimension-seperator">x</span> <span
                                    class="dimension-input"><input id="ember733"
                                        class="ember-text-field text-right ember-view form-control"
                                        type="text"></span>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-secondary dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        in
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right border-0"
                                        style="width: fit-content;">
                                        <button class="dropdown-item ac-option" type="button" data-ember-action=""
                                            data-ember-action-736="736" style="width: fit-content;">cm</button>
                                        <button class="dropdown-item ac-option item-focus" type="button"
                                            data-ember-action="" data-ember-action-737="737"
                                            style="width: fit-content;">in</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="code">CPNP (UK/Europe) <span class="field_required">*</span></label>
                            <div class="input-group">
                                <div class="input-group mb-3">
                                    <input v-model.number="product.cpnp" type="text" class="form-control"
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
                                    <input v-model.number="product.place" type="text" class="form-control"
                                        placeholder="Production Place" aria-label="Product Weight">
                                </div>
                            </div>
                            <span class="error" v-if="errors && errors.place">
                                @{{ errors.code[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="image">{{ __('translate.Image') }} </label>
                            <input name="image" @change="onFileSelected" type="file" class="form-control"
                                id="image">
                            <span class="error" v-if="errors && errors.image">
                                @{{ errors.image[0] }}su
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
                            <textarea type="text" v-model="product.usage" class="form-control" name="usage" placeholder="Usage"></textarea>
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
                                v-model="product.buying">
                            <span class="error" v-if="errors && errors.buying">
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


                        <div class="form-group col-md-4"
                            v-if="product.type == 'is_single' || product.type == 'is_service'">
                            <label for="price">Commudity code/HS code<span class="field_required">*</span></label>
                            <input type="text" class="form-control" placeholder="HS Code"
                                v-model="product.hscode">
                            <span class="error" v-if="errors && errors.hscode">
                                @{{ errors.price[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4"
                            v-if="product.type == 'is_single' || product.type == 'is_service'">
                            <label for="price">Unit price<span class="field_required">*</span></label>
                            <input type="text" class="form-control" placeholder="Unit Price"
                                v-model="product.price">
                            <span class="error" v-if="errors && errors.price">
                                @{{ errors.price[0] }}
                            </span>
                        </div>

                        <div class="form-group col-md-4"
                            v-if="product.type == 'is_single' || product.type == 'is_service'">
                            <label for="price">RRP (GBP)<span class="field_required">*</span></label>
                            <div class="form-control dimension-fields rem">
                                <input type="text" id="price" class="input_in" placeholder="Ex. 10"
                                    v-model="product.rrp">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-secondary dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        GBP
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right border-0"
                                        style="width: fit-content;">
                                        <button class="dropdown-item ac-option" type="button"
                                            style="width: fit-content;" data-currency="EUR">EUR</button>
                                        <button class="dropdown-item ac-option item-focus" type="button"
                                            style="width: fit-content;" data-currency="USD">USD</button>
                                    </div>
                                </div>

                            </div>
                            <span class="error" v-if="errors && errors.rrp">
                                @{{ errors.price[0] }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row my-3">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <div class="form-group">
                    <table class="table">
                      <thead>
                        <tr class="">
                          <th scope="col"
                            class=""  colspan="2"
                          >
                            Item Details
                          </th>
                          <th scope="col" class="">
                            Quantity
                          </th>
                          <th scope="col" class="">
                            Selling Price
                          </th>
                          <th scope="col" class="">
                            Cost Price
                          </th>
                        </tr>
                      </thead>
                      <tbody  id="myTable" class="">
                        <tr
                          class="ember-view line-item new-line-item ember305"
                        >
                          <div>
                              <td
                            id="ember307"
                            class="trr">
                            <div>
                              <svg
                                version="1.1"
                                id="Layer_1"
                                xmlns="http://www.w3.org/2000/svg"
                                x="0"
                                y="0"
                                viewBox="0 0 512 512"
                                xml:space="preserve"
                                class="icon icon-picture d-block m-auto"
                              >
                                <path
                                  d="M64 439.1V388c0-3.2 1-6.3 2.7-9l56.2-83.2c3.1-4.6 9.3-5.8 13.8-2.7l80.9 53.9c4 2.6 9.2 2.1 12.6-1.2l115.1-115.1c3.9-3.9 10.2-3.9 14.1 0l83.8 83.7c3 3 4.8 7.1 4.8 11.3v113.4c0 4.4-3.8 8-8.2 8H72c-4.4 0-8-3.6-8-8z"
                                ></path>
                                <circle cx="208" cy="239.1" r="48"></circle>
                                <path
                                  d="M0 159.1v320.5c0 17.7 14.3 32 32 32l448-.4c17.7 0 32-14.3 32-32V159.1c0-17.7-14.3-32-32-32H32c-17.7 0-32 14.3-32 32zm464 320H48c-8.8 0-16-7.2-16-16v-288c0-8.8 7.2-16 16-16h416c8.8 0 16 7.2 16 16v288c0 8.8-7.2 16-16 16z"
                                ></path>
                              </svg>
                            </div>
                          </td>
                          <td
                            id="ember309"
                            class="ember-view line-item-column item-details "
                          >
 <div class="dropdown dropdown1" >
    <input type="text" id="dropdownInput" data-toggle="dropdown" class="form-control dropdownInput searchInput" placeholder="Search...">
    <div class="dropdown-menu dropdown-menu1" aria-labelledby="dropdownInput" style="width: 100%;">
      <!--<input type="text" id="searchInput" class="form-control searchInput" placeholder="Type to search...">-->
      <div class="dropdown-divider"></div>
      <div class="  w-100 bg-hover-primary">
          <div class="dropdown-item dropdown-item1 d-flex justify-content-between">
              <div>
              <h5>Home</h5>
              <p>0000</p>
             </div>
              <div>
              <h4>Price</h4>
              <span>0000</span>
               </div>
          </div>
          <div class="dropdown-item dropdown-item1 d-flex justify-content-between">
              <div>
              <h5>About</h5>
              <p>0000</p>
             </div>
              <div>
              <h4>Price</h4>
              <span>0000</span>
               </div>
          </div>
      </div>
    </div>
  </div>
                          </td>
                          <td
                            id="ember312"
                            class="ember-view line-item-column item-qty trr">
                            <div>
                              <input
                                id="ember313"
                                class="ember-text-field text-right ember-view form-control"
                                type="text"
                              />
                              <div class="font-xs text-muted px-3 pb-3 text-right">
                                
                              </div>
                            </div>
                          </td>
                          <td
                            id="ember314"
                            class="trr"
                          >
                            <!---->
                            <div>0.00</div>
                          </td>
                          <td
                            id="ember315"
                            class="trr"
                          >
                            <div class="d-flex justify-content-between">
                                <div>
                              0.00
                            </div>
                             <button class="deleteButton" type="button"> <svg id="Layer_2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 472.75 472.75"><g id="Layer_1-2"><path d="M403.52 69.24C358.88 24.59 299.52 0 236.38 0S113.88 24.59 69.24 69.24C24.59 113.88 0 173.24 0 236.38s24.59 122.49 69.24 167.14c44.64 44.65 104 69.23 167.14 69.23s122.5-24.58 167.14-69.23c44.65-44.65 69.23-104 69.23-167.14s-24.58-122.5-69.23-167.14zM236.38 430.75C129.2 430.75 42 343.56 42 236.38S129.2 42 236.38 42s194.37 87.2 194.37 194.38-87.19 194.37-194.37 194.37z"></path><path d="M322.05 292.35c8.2 8.2 8.2 21.5 0 29.7-4.1 4.1-9.47 6.15-14.85 6.15s-10.75-2.05-14.85-6.15l-55.97-55.97-55.98 55.97c-4.1 4.1-9.47 6.15-14.85 6.15s-10.75-2.05-14.85-6.15c-8.2-8.2-8.2-21.5 0-29.7l55.98-55.97-55.98-55.98c-8.2-8.2-8.2-21.5 0-29.7s21.5-8.2 29.7 0l55.98 55.98 55.97-55.98c8.2-8.2 21.5-8.2 29.7 0s8.2 21.5 0 29.7l-55.97 55.98 55.97 55.97z"></path></g></svg> </button>
                          
                            </div>
                            </td>
                          </div>
                        </tr>
                        
                      </tbody>
                      <tbody>
                        <div>
                            <tr>
                                <td colspan="2">
                                  <div class="pt-2" onclick="addNewRow()">
                                    <a
                                      href="#"
                                      class="float-left pr-3"
                                      data-ember-action=""
                                      data-ember-action-319="319">
                                      <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 512 512"
                                        class="icon icon-sm text-open fill-azure-blue align-middle"
                                      >
                                        <path
                                          d="M256 15C122.9 15 15 122.9 15 256s107.9 241 241 241 241-107.9 241-241S389.1 15 256 15zm122 263H278v100c0 12.2-9.8 22-22 22s-22-9.8-22-22V278H134c-12.2 0-22-9.8-22-22s9.8-22 22-22h100V134c0-12.2 9.8-22 22-22s22 9.8 22 22v100h100c12.2 0 22 9.8 22 22s-9.8 22-22 22z"
                                        ></path>
                                        <path
                                          fill="#FFF"
                                          d="M378 234H278V134c0-12.2-9.8-22-22-22s-22 9.8-22 22v100H134c-12.2 0-22 9.8-22 22s9.8 22 22 22h100v100c0 12.2 9.8 22 22 22s22-9.8 22-22V278h100c12.2 0 22-9.8 22-22s-9.8-22-22-22z"
                                        ></path>
                                        </svg>&nbsp;<span class="text-default"
                                        >Add New Row</span></a >
                                  </div>
                                </td>
                                <td class="">
                                  <div class="pt-2"><div>Total&nbsp;(PKR)&nbsp;:</div></div>
                                </td>
                                <td class="">
                                  <div class="pt-2"><div class="total">00.0</div></div>
                                </td>
                                <td class="">
                                  <div class="pt-2"><div>0.00</div> </div>
                                </td>
                              </tr>
                        </div>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

            <div class="row mt-3">
                <div class="col-lg-6">
                    <button disabled type="submit" class="btn btn-primary" :disabled="SubmitProcessing">
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
                type: "is_single",
                name: "",
                code: "",
                ean: "",
                Type_barcode: "",
                cost: "",
                price: "",
                brand_id: "",
                category_id: "",
                TaxNet: "0",
                tax_method: "1",
                unit_id: "",
                unit_sale_id: "",
                unit_purchase_id: "",
                stock_alert: "0",
                qty_min: 0,
                image: "",
                note: "",
                is_variant: false,
                is_imei: false,
                is_promo: false,
                promo_price: '',
                promo_start_date: new Date().toISOString().slice(0, 10),
                promo_end_date: '',
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
function addNewRow() {
  var newRow = document.getElementsByClassName('ember305')[0].cloneNode(true);
//   $(".trr").show();

  document.getElementById('myTable').appendChild(newRow);
  
  $(".deleteButton").on("click", function () {
    // Remove the corresponding row when the button is clicked
    $(this).closest("tr").remove().indexOf(value) > 0;
  });



  initializeDropdown(newRow);
}


function initializeDropdown(container) {
  $(".searchInput", container).on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $(".dropdown-item1", container).filter(function () {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
    });
  });

  $(".searchInput", container).on("click", function (e) {
    e.stopPropagation();
  });

  $(document).on("click", function (e) {
    if (!$(e.target).closest(".dropdown1").length) {
      $(".dropdown-menu1").hide();
    }
  });

var amount = 100;


var totalAmount = 100;

  $(".dropdownInput", container).on("click", function () {
    // Close other dropdowns
    $(".dropdown-menu1").hide();


    // Show the current dropdown
    $(this).next(".dropdown-menu1").show();
  });

  $(".dropdown-item1", container).on("click", function () {
      
    // document.getElementsByClassName(.trr).style.display:'none';
    // Extract data from the clicked dropdown item
    var itemName = $(this).find("h5").text();
    var itemValue = $(this).find("p").text();
    var inputField = $(this).closest("td").prev().find(".dropdownInput");
    // console.log(inputField)
    var newRow = $(`<tr> <td colspan='2' > <div class="d-flex justify-content-between "> <div>${itemName} </br> ${itemValue}  </div> <button class="deleteButton" type="button"> <svg id="Layer_2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 472.75 472.75"><g id="Layer_1-2"><path d="M403.52 69.24C358.88 24.59 299.52 0 236.38 0S113.88 24.59 69.24 69.24C24.59 113.88 0 173.24 0 236.38s24.59 122.49 69.24 167.14c44.64 44.65 104 69.23 167.14 69.23s122.5-24.58 167.14-69.23c44.65-44.65 69.23-104 69.23-167.14s-24.58-122.5-69.23-167.14zM236.38 430.75C129.2 430.75 42 343.56 42 236.38S129.2 42 236.38 42s194.37 87.2 194.37 194.38-87.19 194.37-194.37 194.37z"></path><path d="M322.05 292.35c8.2 8.2 8.2 21.5 0 29.7-4.1 4.1-9.47 6.15-14.85 6.15s-10.75-2.05-14.85-6.15l-55.97-55.97-55.98 55.97c-4.1 4.1-9.47 6.15-14.85 6.15s-10.75-2.05-14.85-6.15c-8.2-8.2-8.2-21.5 0-29.7l55.98-55.97-55.98-55.98c-8.2-8.2-8.2-21.5 0-29.7s21.5-8.2 29.7 0l55.98 55.98 55.97-55.98c8.2-8.2 21.5-8.2 29.7 0s8.2 21.5 0 29.7l-55.97 55.98 55.97 55.97z"></path></g></svg> </button> </div>  </td>  <td>  <input id="ember313" class="ember-text-field text-right ember-view form-control" type="text"/> </br> PKR100.00 per unit </td> <td class="amount">000.00</td> <td>000</td></tr>`);

    // $(".amount").html(amount);
    // $(".amount").html(amount);
    $(".amount").each(function() {
  // Sum up the values of each element
    totalAmount += parseFloat($(this).html(amount));
    });
    $(".total").html(totalAmount);

    // Append the new row to the table
    $("#myTable").append(newRow);
    


    // Hide the dropdown menu
    $(this).closest(".dropdown-menu1").hide();
    

  $(".deleteButton").on("click", function () {
    // Remove the corresponding row when the button is clicked
    $(this).closest("tr").remove();
  });
    
  });

  $(".dropdown1", container).dropdown();
}



$(document).ready(function () {
  initializeDropdown(document);
});



</script>
@endsection
