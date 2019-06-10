@include('partials.header')
<div id="app" style="background:#f8fafc">
    <div class="home">
        @include('partials.navbar')
    </div>
    <div style="margin-top:59px;">
        @yield('content')
    </div>
    @include('partials.footer')
</div>
@include('partials.scripts')