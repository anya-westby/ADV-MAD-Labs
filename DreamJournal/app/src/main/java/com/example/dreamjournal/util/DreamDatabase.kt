package com.example.dreamjournal.util

import android.content.ContentValues.TAG
import android.util.Log
import com.example.dreamjournal.model.Dream
import com.firebase.ui.firestore.FirestoreRecyclerOptions
import com.google.firebase.firestore.FirebaseFirestore


class DreamDatabase {

    private val db = FirebaseFirestore.getInstance()
    private val dreamRef = db.collection("Dreams")

    fun getOptions(): FirestoreRecyclerOptions<Dream>{
        val query = dreamRef
        val options = FirestoreRecyclerOptions.Builder<Dream>()
            .setQuery(query, Dream::class.java)
            .build()
        return options
    }

    fun addDream(dream: Dream){
        dreamRef.add(dream)
            .addOnSuccessListener {
                Log.d(TAG, "Added document with ID ${it.id}")
            }
    }

    fun deleteDream(id: String){
        dreamRef.document(id).delete()
            .addOnFailureListener { exception ->
                Log.w(TAG, "Error adding document $exception")
            }
    }
}