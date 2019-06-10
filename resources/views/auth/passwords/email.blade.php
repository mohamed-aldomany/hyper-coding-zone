@extends('layouts.auth')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Reset Password</h5>
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <form class="needs-validation form-signin" novalidate  method="POST" action="{{ route('password.email') }}">
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
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Send Password Reset Link</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection