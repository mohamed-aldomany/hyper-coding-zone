<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Socialite;
use App\User;
use Auth;
use DB;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/Home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    
    //facebook login functions =============================================>

    public function FacebookRedirectToProvider()
    {
        return Socialite::driver('facebook')->redirect();
    }


    public function FacebookHandleProviderCallback()
    {
        $facebook_user = Socialite::driver('facebook')->user();

        $finduser = User::where('email',$facebook_user->email)->first();
        if($finduser){
            Auth::login($finduser);
            return redirect('/Home');
        }else{
            $user = new User();
            $user->name = $facebook_user->name;
            $user->email = $facebook_user->email;
            $user->password = bcrypt(5317854548857480578);
            $user->save();
            Auth::login($user);
            return redirect('/Home');
        }
    }


    //google  login functions =============================================>

    public function GoogleRedirectToProvider()
    {
        return Socialite::driver('google')->redirect();
    }

    public function GoogleHandleProviderCallback()
    {
        $google_user = Socialite::driver('google')->user();

        $finduser = User::where('email',$google_user->email)->first();
        if($finduser){
            Auth::login($finduser);
            return redirect('/Home');
        }else{
            // $user = 
            // DB::table('users')->insert([
            //     [
            //         'name' => $google_user->name, 
            //         'email' => $google_user->email,
            //         'password' => bcrypt(5317854548857480578),
            //         'email_verified_at' => NOW()
            //     ],
            // ]);
            $user = new User();
            $user->name = $google_user->name;
            $user->email_verified_at=NOW();
            $user->email = $google_user->email;
            $user->password = bcrypt(5317854548857480578);
            $user->save();
            Auth::login($user);
            return redirect('/Home');             
        }
    }


}
