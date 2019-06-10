@include('partials.header')

<div id="app">
    <div class="home">
        @include('partials.js_nav')
    </div>
    <div style="margin-top:59px;">
        <router-view></router-view>
        @yield('content')
        <vue-progress-bar></vue-progress-bar>
    </div>
</div>
{{-- 
@include('partials.footer') --}}
@include('partials.scripts')