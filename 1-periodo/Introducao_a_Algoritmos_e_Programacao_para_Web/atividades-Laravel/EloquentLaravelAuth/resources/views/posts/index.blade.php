@extends('layouts.app')
@section('content')
<div class="container">
<a href="{{ route('posts.create') }}" class="btn btn-primary">Create Post</a>
<table class="table mt-4">
<thead>
<tr>
<th>Title</th>
<th>Content</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
@foreach($posts as $post)
<tr>
<td>{{ $post->title }}</td>
<td>{{ $post->content }}</td>
<td>
<a href="{{ route('posts.edit', $post) }}" class="btn btn-secondary">Edit</a>

<form action="{{ route('posts.destroy', $post) }}" method="POST" style="display:inline;">

@csrf

@method('DELETE')
<button type="submit" class="btn btn-danger">Delete</button>

</form>
</td>
</tr>
@endforeach
</tbody>
</table>
</div>
@endsection