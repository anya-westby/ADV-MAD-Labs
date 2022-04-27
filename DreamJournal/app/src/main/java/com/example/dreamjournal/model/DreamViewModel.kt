package com.example.dreamjournal.model

import androidx.lifecycle.ViewModel
import com.example.dreamjournal.util.DreamDatabase

//View Model
class DreamViewModel: ViewModel() {
    private val dreamDB = DreamDatabase()
    val options = dreamDB.getOptions()

    fun addDream(dream: Dream){
        dreamDB.addDream(dream)
    }
    fun deleteDream(id: String){
        dreamDB.deleteDream(id)
    }
}