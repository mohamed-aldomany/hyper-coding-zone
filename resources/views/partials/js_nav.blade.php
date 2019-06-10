<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="/"><img src="/Image/logo.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                @guest
                @else
                    <li class="nav-item">
                        <router-link to="/Home" class="nav-link">courses </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/communityintro" class="nav-link">community </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/examintro" class="nav-link">exams </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/academicintro" class="nav-link">became academic </router-link>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {{Auth::user()->name}}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <router-link to="/profile" class="dropdown-item">Settings &nbsp;&nbsp;&nbsp;<i class="fas fa-user-cog"></i></router-link>
                            <router-link class="dropdown-item" to="/ideintro">IDE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fas fa-laptop-code"></i></router-link>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="{{ route('logout') }}"
                                onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <i class="fas fa-sign-out-alt"></i>
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                @endguest
            </ul>
        </div>
    </nav>