@extends('layouts.master')
@section('main-content')
@section('page-css')
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/nprogress.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/autocomplete.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/barcode.css') }}">
    <style>
        .barcode_non_a4 .style8 {
            width: 4in;
            /* Adjusted width to fit 8 labels per page */
            height: 2.5in;
            /* Adjusted height for better spacing */
            margin: 0 0.1in;
            padding-top: 0.1in;
            font-size: 14px;
            line-height: 20px;
        }

        .pro_h {
            height: 100px;
            margin: 5px 0px
        }

        .pro_h2 {
            height: 50px;
            margin: 5px 0px
        }

        .center {
            display: flex;
            justify-content: center;
        }
    </style>
@endsection

<div class="breadcrumb">
    <h1>Labels</h1>
</div>
<div style="display: flex;justify-content: end;">
    <button onclick="print_all_Barcode()" class="btn btn-success  pull-right m-1"><i class="i-Billing"></i>
        Print Labels
    </button>
</div>
<hr style="border: 1px solid black;">

<div class="row" id="section_barcode">
    <div class="col-lg-12 mb-3">
        <div class="card">
            <div class="card-body">
                <h4
                    style="text-align: center;
                margin-top: 10px;
                font-size: 1.5rem;
                line-height: 1;">
                    Single Product Labels</h4>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div id="print_barcode_label" class="barcode-row print_barcode_label">
                            @php
                                $recordCount = 0;
                                $sheetCount = 0;
                            @endphp
                            <div class="barcode_non_a4"> <!-- Start first sheet -->
                                <div class="row" style="margin: 0%">
                                    @for ($i = 0; $i < count($filteredArray1); $i++)
                                        <!-- Check if it's time to start a new sheet -->
                                        @if ($recordCount % 8 == 0 && $recordCount != 0)
                                </div> <!-- Close previous sheet -->
                            </div>
                            @php $sheetCount++; @endphp
                            <div class="barcode_non_a4"> <!-- Start new sheet -->
                                <div class="row" style="margin: 0%">
                                    @endif
                                    <!-- Your loop content here -->

                                    <div class="barcode-item style8">
                                        <span class="barcode-name">{{ $filteredArray1[$i][0] }}</span>
                                        <span class="barcode-name pro_h2">{{ $filteredArray1[$i][3] }}</span>
                                        <span class="barcode-name">{{ $filteredArray1[$i][1] }}</span>
                                        @php
                                            $ean = $filteredArray1[$i][2];
                                            $ean_length = strlen($ean);
                                            if ($ean_length == 12) {
                                                $e = \Milon\Barcode\DNS1D::getBarcodeHTML('0' . trim($ean), 'EAN13');
                                            } else {
                                                $e = \Milon\Barcode\DNS1D::getBarcodeHTML(trim($ean), 'EAN13');
                                            }
                                        @endphp
                                        <div class="center">{!! $e !!}</div>
                                        <div class="ean-number">
                                            @foreach (str_split($ean) as $digit)
                                                {{ $digit }}&nbsp;
                                            @endforeach
                                        </div>
                                        <span class="barcode-name">Quantity : {{ $filteredArray1[$i][4] }}</span>
                                    </div>
                                    @php $recordCount++; @endphp <!-- Increment record count -->
                                    @endfor
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <h4
                    style="text-align: center;
                margin-top: 10px;
                font-size: 1.5rem;
                line-height: 1;">
                    Kit Product Labels</h4>


                <div class="row mt-3">
                    <div class="col-md-12">
                        <div id="print_barcode_label" class="barcode-row print_barcode_label">
                            @php
                                $recordCount = 0;
                                $sheetCount = 0;
                                $quantityCount = 0;
                            @endphp
                            <div class="barcode_non_a4"> <!-- Start first sheet -->
                                <div class="row" style="margin: 0%">
                                    @for ($i = 0; $i < count($filteredArray2); $i++)
                                        <!-- Check if it's time to start a new sheet -->
                                        @if ($recordCount % 8 == 0 && $recordCount != 0)
                                </div> <!-- Close previous sheet -->
                            </div>
                            @php $sheetCount++; @endphp
                            <div class="barcode_non_a4"> <!-- Start new sheet -->
                                <div class="row" style="margin: 0%">
                                    @endif
                                    <!-- Your loop content here -->
                                    <div class="barcode-item style8">
                                        <div style="display: flex; justify-content:space-between">
                                            <div style="display: flex; justify-content:center;width: 100%;">
                                                <span class="barcode-name">{{ $filteredArray2[$i][0] }}</span>
                                            </div>
                                            <div style="display: flex; justify-content:end; margin-right: 10px;">
                                                @php
                                                    $currentBarcode = $filteredArray2[1];
                                                    $occurrences = 0;
                                                @endphp
                                                @foreach ($filteredArray2 as $innerBarcode)
                                                    @if ($currentBarcode == $innerBarcode[1])
                                                        @php
                                                            $occurrences++;
                                                        @endphp
                                                    @endif
                                                @endforeach
                                                @if ($occurrences == 1)
                                                    <span class="barcode-name">{{ $filteredArray2[$i][4] }}</span>
                                                @else
                                                    <!-- If barcode occurs more than once, show the occurrences -->
                                                    <span
                                                        class="barcode-name">{{ $occurrences }}/{{ $filteredArray2[$i][4] }}</span>
                                                @endif
                                            </div>
                                        </div>
                                        <span class="barcode-name pro_h">{{ $filteredArray2[$i][3] }}</span>
                                        <span class="barcode-name">{{ $filteredArray2[$i][1] }}</span>
                                        @php
                                            $ean = $filteredArray2[$i][2];
                                            $ean_length = strlen($ean);
                                            if ($ean_length == 12) {
                                                $e = \Milon\Barcode\DNS1D::getBarcodeHTML('0' . trim($ean), 'EAN13');
                                            } else {
                                                $e = \Milon\Barcode\DNS1D::getBarcodeHTML(trim($ean), 'EAN13');
                                            }
                                        @endphp
                                        <div class="center">{!! $e !!}</div>
                                        <div class="ean-number">
                                            @foreach (str_split($ean) as $digit)
                                                {{ $digit }}&nbsp;
                                            @endforeach
                                        </div>
                                        <span class="barcode-name">Quantity : {{ $filteredArray2[$i][4] }}</span>
                                    </div>
                                    @php $recordCount++; @endphp <!-- Increment record count -->
                                    @endfor
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function print_all_Barcode() {
        var divContents = "";
        var barcodeLabels = document.getElementsByClassName("print_barcode_label");
        for (var i = 0; i < barcodeLabels.length; i++) {
            divContents += barcodeLabels[i].innerHTML;
        }

        var a = window.open("", "", "height=500, width=500");
        a.document.write('<link rel="stylesheet" href="/assets/styles/vendor/print_label.css">');
        a.document.write("<html><body>");
        a.document.write(divContents);
        a.document.write("</body></html>");
        a.document.close();
        setTimeout(() => {
            a.print();
        }, 1000);
    }
</script>
@endsection