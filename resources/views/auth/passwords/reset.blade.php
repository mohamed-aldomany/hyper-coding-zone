@extends('layouts.auth')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Reset Password</h5>
                    <form class="needs-validation form-signin" novalidate method="POST" action="{{ route('password.update') }}">
                        @csrf

                        <input type="hidden" name="token" value="{{ $token }}">
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
                        <div class="form-label-group">
                            <input type="password" id="inputPasswordConfirmation" class="form-control" placeholder="Password Confirmation" name="password_confirmation" required>
                            <label for="inputPasswordConfirmation">Password Confirmation</label>
                        </div>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Reset Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
