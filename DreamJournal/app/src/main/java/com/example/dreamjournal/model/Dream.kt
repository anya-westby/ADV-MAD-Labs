package com.example.dreamjournal.model

//Dream Model
data class Dream(val date: String?, val memo: String?) {
    constructor(): this("", ""){}

}