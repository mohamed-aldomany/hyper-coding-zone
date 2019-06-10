@include('partials.header')

<div id="app">
    <div class="home">
        @include('partials.navbar')
    </div>
    <div style="margin-top:59px;">
        @yield('content')
    </div>
</div>
{{-- 
@include('partials.footer') --}}
@include('partials.scripts')