@extends('layouts.auth')

@section('content')

{{-- <h1 class="auth-text">hyper coding zone <i class="fas fa-blind" style="color:darkred;font-size:50px;"></i></h1> --}}

<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-7 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center"><img src="/Image/logo.png" style="height:30px;"> Log In to Your HCZ Account!</h5>
                    <form class="needs-validation form-signin" novalidate  method="POST" action="{{ route('login') }}">
                        @csrf
                         
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('name') }}" placeholder="Email address" name="email" required autofocus>
                            <label for="inputEmail">Email address</label>
                            @if ($errors->has('email'))
                                <div class="invalid-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </div>
                            @endif
                        </div>
            
                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="Password" name="password" required>
                            <label for="inputPassword">Password</label>
                            @if ($errors->has('password'))
                                <div class="invalid-feedback">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </div>
                            @endif
                        </div>

                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck1" name="remeber">
                            <label class="custom-control-label" for="customCheck1">Remember password</label>
                        </div>        
                        @if (Route::has('password.request'))
                            <a class="btn btn-link" href="{{ route('password.request') }}">
                                <h6>{{ __('Forgot Your Password?') }}</h6>
                            </a>
                        @endif
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                    </form>

                </div>
            </div>
        </div>
        <div class="col-sm-3 col-md-5 col-lg-5 mx-auto">
            <div class="card text-center card-signin my-5" style="width: 18rem;">
                <div class="card-body">
                  <img src="/Image/logo.png" style="height:50px;"><br><br>
                  <h5 class="card-title">Log in With Social Network</h5><hr>
                  <a href="/login/facebook" class="btn btn-lg btn-facebook btn-block text-uppercase"><i class="fab fa-facebook-f mr-2"></i>Facebook</a>
                  <a href="/login/google" class="btn btn-lg btn-google btn-block text-uppercase"><i class="fab fa-google mr-2"></i>Google</a>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
