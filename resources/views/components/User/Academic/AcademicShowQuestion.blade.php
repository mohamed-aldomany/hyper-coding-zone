@extends('layouts.master_reload')
@section('content')
    <div class="container" style="margin-top: 150px; margin-bottom: 30px;">
        <form id="quiz" name="quiz" action="/stud/exam/showresult/2" method="GET">
            {{ csrf_field() }}
            <input type="hidden" value="{{$examid}}" name="examid">
            <input type="hidden" value="{{$tid}}" name="tid">
            <input type="hidden" value="{{$cid}}" name="cid">
        
            @foreach ($questions as $q)
                <?php
                    $shuffle = array($q->choise1,$q->choise2,$q->choise3);
                    shuffle($shuffle);
                ?>
                <section id="{{$q->question_no}}">
                    <section class="mt-5">
                        <div class="jumbotron jumbotron-fluid" style="padding:40px !important">
                            <div class="container">
                                <p class="lead">{{$q->question_no}}-) {{$q->question}} ?</p>
                            </div>
                        </div>
                    </section>
                    <section>
                        <ul class="list-group">
                            <li class="list-group-item disabled" aria-disabled="true">choose 1 answer</li>
                            <li class="list-group-item">
                                <input type="radio" name="question{{$q->question_no}}" id="exampleRadios1" value="{{$shuffle[0]}}"> {{$shuffle[0]}}
                            </li>
                            <li class="list-group-item">
                                <input type="radio" name="question{{$q->question_no}}" id="exampleRadios1" value="{{$shuffle[1]}}"> {{$shuffle[1]}}
                            </li>
                            <li class="list-group-item">
                                <input type="radio" name="question{{$q->question_no}}" id="exampleRadios1" value="{{$shuffle[2]}}"> {{$shuffle[2]}}
                            </li>
                        </ul>
                    </section>
                </section><br>
                {{-- <div class="btn-group" role="group" aria-label="Basic example">
                    <a href="#{{$q->question_no-1}}" class="btn btn-secondary">Prev</a>
                    <a href="#{{$q->question_no+1}}" class="btn btn-secondary">Next</a>
                </div> --}}
            @endforeach
            <button class="btn btn-dark"id="button" type="submit" value="Go Result">I'm finished!</button>
        </form>
    </div>
@endsection