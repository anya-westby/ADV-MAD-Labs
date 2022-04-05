package com.example.dreamjournal.model

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class DreamViewModel: ViewModel() {
    val dreamList = MutableLiveData<ArrayList<Dream>>()
    private var newList = ArrayList<Dream>()

    fun add(item: Dream){
        newList.add(item)
        dreamList.value = newList
    }
    fun delete(item: Dream){
        newList.remove(item)
        dreamList.value = newList
    }
}