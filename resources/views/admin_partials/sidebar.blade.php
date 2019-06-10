 <!-- Main Sidebar Container -->
 <aside class="main-sidebar sidebar-dark-primary elevation-4">
     <!-- Brand Logo -->
     <a href="index3.html" class="brand-link">
         <img src="dist/img/AdminLTELogo.png" alt="Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
         <span class="brand-text font-weight-light">AdminLTE 3</span>
     </a>

     <!-- Sidebar -->
     <div class="sidebar">
         <!-- Sidebar user panel (optional) -->
         <div class="user-panel mt-3 pb-3 mb-3 d-flex">
             <div class="image">
                 <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
             </div>
             <div class="info">
                 <a href="#" class="d-block">Alexander Pierce</a>
             </div>
         </div>

         <!-- Sidebar Menu -->
         <nav class="mt-2">
             <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                 data-accordion="false">
                 <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                 <li class="nav-item has-treeview menu-close">
                     <a href="#" class="nav-link active">
                         <i class="nav-icon fa fa-dashboard"></i>
                         <p>
                             Package 1
                             <i class="right fa fa-angle-left"></i>
                         </p>
                     </a>
                     <ul class="nav nav-treeview">
                         <li class="nav-item">
                             <router-link to="/admin/users" class="nav-link">
                                 <p>Users</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/profiles" class="nav-link">
                                 <p>Profiles</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/tracks" class="nav-link">
                                 <p>Tracks</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/courses" class="nav-link">
                                 <p>Courses</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/lessons" class="nav-link">
                                 <p>Lessons</p>
                             </router-link>
                         </li>
                     </ul>
                 </li>
                 {{-- ----------------------------------------------------------------------- --}}
                 <li class="nav-item has-treeview menu-close">
                     <a href="#" class="nav-link active">
                         <i class="nav-icon fa fa-dashboard"></i>
                         <p>
                             Package 2
                             <i class="right fa fa-angle-left"></i>
                         </p>
                     </a>
                     <ul class="nav nav-treeview">
                         <li class="nav-item">
                             <router-link to="/admin/exams" class="nav-link">
                                 <p>Exams</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/questions" class="nav-link">
                                 <p>Questions</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/articles" class="nav-link">
                                 <p>Article</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/comments" class="nav-link">
                                 <p>Comments</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/replies" class="nav-link">
                                 <p>Replies</p>
                             </router-link>
                         </li>
                     </ul>
                 </li>

                 {{-- ----------------------------------------------------------------------- --}}
                 <li class="nav-item has-treeview menu-close">
                     <a href="#" class="nav-link active">
                         <i class="nav-icon fa fa-dashboard"></i>
                         <p>
                             Package 3
                             <i class="right fa fa-angle-left"></i>
                         </p>
                     </a>
                     <ul class="nav nav-treeview">
                         <li class="nav-item">
                             <router-link to="/admin/course-achivments" class="nav-link">
                                 <p>Course-Achivments</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/course-details" class="nav-link">
                                 <p>Course-Details</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/track-achivments" class="nav-link">
                                 <p>Track-Achivments</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/suggestions" class="nav-link">
                                 <p>Suggestions</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/watch-later" class="nav-link">
                                 <p>Watch-Later</p>
                             </router-link>
                         </li>
                     </ul>
                 </li>

                 {{-- ----------------------------------------------------------------------- --}}
                 <li class="nav-item has-treeview menu-close">
                     <a href="#" class="nav-link active">
                         <i class="nav-icon fa fa-dashboard"></i>
                         <p>
                             Package 4
                             <i class="right fa fa-angle-left"></i>
                         </p>
                     </a>
                     <ul class="nav nav-treeview">
                         <li class="nav-item">
                             <router-link to="/admin/user-profiles" class="nav-link">
                                 <p>User-Profile</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/user-tracks" class="nav-link">
                                 <p>User-Tracks</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/user-courses" class="nav-link">
                                 <p>User-Courses</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/user-lessons" class="nav-link">
                                 <p>User-Lessons</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/user-exams" class="nav-link">
                                 <p>User-Exams</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/user-course-achivment" class="nav-link">
                                 <p>User-Course-Achivment</p>
                             </router-link>
                         </li>
                         <li class="nav-item">
                             <router-link to="/admin/user-track-achivment" class="nav-link">
                                 <p>User-Track-Achivment</p>
                             </router-link>
                         </li>
                     </ul>
                 </li>




                 <li class="nav-item">
                     <a class="nav-link btn btn-danger" href="{{ route('logout') }}" onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
                         {{ __('Logout') }}
                         <i class="fas fa-sign-out-alt"></i>
                     </a>
                     <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                         @csrf
                     </form>
                 </li>
             </ul>
         </nav>
         <!-- /.sidebar-menu -->
     </div>
     <!-- /.sidebar -->
 </aside>
