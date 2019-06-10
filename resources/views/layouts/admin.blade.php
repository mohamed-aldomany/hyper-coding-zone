@include('admin_partials.head')

  <div id="app">
    <div class="wrapper">

    {{-- @include('admin_partials.navbar') --}}
    @include('admin_partials.sidebar')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper mt-3">
      <!-- Main content -->
      <div class="content">

        <router-view></router-view>
        @yield('content')
        <vue-progress-bar></vue-progress-bar>
      
      </div>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
  </div>
  </div>
@include('admin_partials.scripts')