@extends('layouts.master')
@section('main-content')
@section('page-css')
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/nprogress.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/autocomplete.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/barcode.css') }}">
@endsection

<div class="breadcrumb">
    <h1>{{ __('translate.Print_Labels') }}</h1>
</div>

<div class="separator-breadcrumb border-top"></div>


<!-- begin::main-row -->
<div class="row" id="section_barcode">
    <div class="col-lg-12 mb-3">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <form action="{{ url('products/print_labels_bulk') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group col-md-6">
                            <label class="ul-form__label">Select File to Upload (.xlx) <span
                                    class="field_required">*</span></label>
                            <input type="file" name="label_file">
                            <button type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </div>
@endsection
