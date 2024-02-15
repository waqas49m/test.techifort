<!-- Footer Start -->
<div class="flex-grow-1"></div>
<div class="app-footer" style="margin-top:0; height:57px">
    <div class="row" style="m-0 p-0">
        <div class="col-md-4">
            <p style="mt-0"><strong>{{$setting->footer}}</strong></p>
            <div class="footer-bottom border-top pt-0 d-flex flex-column flex-sm-row align-items-center justify-content-evenly">  {{-- pt-3 --}}
                <img class="logo" src="{{asset('images/'.$setting->logo)}}" alt="">
                <div>
                    <div><p class="m-0">&copy; <?php echo date ('Y'); ?>  {{$setting->developed_by}} </p></div>
                    <div><p class="m-0">{{ __('translate.All rights reserved') }}</p></div>
               </div>
                

            </div>

        </div>
    </div>
</div>
<!-- fotter end -->