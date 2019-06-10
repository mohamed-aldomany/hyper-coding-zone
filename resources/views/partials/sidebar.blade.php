<!-- Sidebar  -->
<nav id="sidebar">
    <div class="sidebar-header">
        <h3>User Name</h3>
    </div>

    <ul class="list-unstyled components">
        <p>Manage Website</p>
        <li>
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="admin-dropdown dropdown-toggle">Main1</a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="/manage/users">Users</a>
                </li>
                <li>
                    <a href="#">Profiles</a>
                </li>
                <li>
                    <a href="#">Tracks</a>
                </li>
                <li>
                    <a href="#">Courses</a>
                </li>
                <li>
                    <a href="#">Lessons</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">About</a>
        </li>
        <li>
            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="admin-dropdown dropdown-toggle">Pages</a>
            <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Page 1</a>
                </li>
                <li>
                    <a href="#">Page 2</a>
                </li>
                <li>
                    <a href="#">Page 3</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">Portfolio</a>
        </li>
        <li>
            <a href="#">Contact</a>
        </li>
    </ul>

    <ul class="list-unstyled CTAs">
        <li>
            <a class="btn btn-danger" href="{{ route('logout') }}"
            onclick="event.preventDefault();
            document.getElementById('logout-form').submit();">Logout <i class="fas fa-sign-out-alt"></i></a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </li>
    </ul>
</nav>
