---
layout: post
title: "Elixir MIX"
description: "Journey and Discovery of Elixir (journal)"
category: Elixir 
tags: 
image: post_one.jpg
---
#Goal

##Setup Links - What you need to do before diving into the code

<ol>
<li><a href="http://rustamserg.com/?p=171">Vim</a></li>
<li>Webstorm Elixir Plugin</li>
<li><a href="http://www.phoenixframework.org/">Phoenix</a></li>
<li>Google Compute Engine </li>
</ol>

<h3>Inventory of Parts</h3>

<ol>
<li><strong>Erlang</strong> Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability. </li>
<li><strong>Elixir</strong> Elixir is a dynamic, functional language designed for building scalable and maintainable applications.</li>
<li><strong>Cowboy</strong> Cowboy is a small, fast and modular HTTP server written in Erlang.</li>
<li><strong>Cowlib</strong> Cowlib is a support library for manipulating Web protocols.</li>
<li><strong>Phoenix</strong> Elixir Web Framework targeting full-featured, fault tolerant applications with realtime functionality</li>
<li><strong>Plug</strong> A specification for composable modules in between web applications Connection adapters for different web servers in the Erlang VM </li>
<li><strong>Poison</strong> Poison is a new JSON library for Elixir focusing on wicked-fast</li>
<li><strong>Ranch</strong> Ranch is a socket acceptor pool for TCP protocols.</li>
</ol>


[what is Mix]

Mix is a build tool that provides tasks for creating, compiling,
testing (and soon releasing) Elixir projects.
Mix is inspired by the Leiningen build tool for Clojure and was written by one of its contributors.



Cheats -

1. mix phoenix.new elixir_mix ../elixir_mix
2. cd
3. mix do deps.get, compile
4. mix phoenix.server

###Directory
* _build
* deps
* config
-- locales
* lib
-- elixir_mix
* prev
-- static
---- css
---- images
---- js
* test
* web
-- channels
-- controllers
-- models
-- templates
-- views




