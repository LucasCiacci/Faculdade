package com.example.ativmob

import com.google.common.truth.Truth.assertThat
import org.junit.Test

// Assuming Item and filterItemsLogic are defined in the correct scope,
// possibly in the main source set under a similar package structure.
// If Item is a data class, it should be defined, e.g.:
// data class Item(val id: Int, val name: String, val description: String)
// And filterItemsLogic should be a function, e.g.:
// fun filterItemsLogic(allItems: List<Item>, query: String): List<Item> { /* ... logic ... */ }


class FilterItemsLogicTest {
    private val sampleItems = listOf(
        Item(1, "Apple iPhone 13", "Latest smartphone from Apple"),
        Item(2, "Samsung Galaxy S22", "Flagship Android phone by Samsung"),
        Item(3, "Google Pixel 6", "Pixel phone with Google Tensor chip"),
        Item(4, "Apple MacBook Pro", "Powerful laptop for professionals"),
        Item(5, "Dell XPS 15", "Windows laptop with stunning display")
    )

    @Test
    fun `filterItemsLogic with blank query returns all items`() {
        val filtered = filterItemsLogic(sampleItems, "   ") // Query with spaces
        assertThat(filtered).containsExactlyElementsIn(sampleItems)
    }

    @Test
    fun `filterItemsLogic with empty query returns all items`() {
        val filtered = filterItemsLogic(sampleItems, "")
        assertThat(filtered).containsExactlyElementsIn(sampleItems)
    }

    @Test
    fun `filterItemsLogic filters by name case insensitive`() {
        val filtered = filterItemsLogic(sampleItems, "apple")
        assertThat(filtered).containsExactly(
            Item(1, "Apple iPhone 13", "Latest smartphone from Apple"),
            Item(4, "Apple MacBook Pro", "Powerful laptop for professionals")
        ).inOrder() // inOrder() is optional, but good for list comparison
    }

    @Test
    fun `filterItemsLogic filters by description case insensitive`() {
        val filtered = filterItemsLogic(sampleItems, "LAPTOP")
        assertThat(filtered).containsExactly(
            Item(4, "Apple MacBook Pro", "Powerful laptop for professionals"),
            Item(5, "Dell XPS 15", "Windows laptop with stunning display")
        ).inOrder()
    }

    @Test
    fun `filterItemsLogic filters by name or description`() {
        val filtered = filterItemsLogic(sampleItems, "phone")
        assertThat(filtered).containsExactly(
            Item(1, "Apple iPhone 13", "Latest smartphone from Apple"),
            Item(2, "Samsung Galaxy S22", "Flagship Android phone by Samsung"),
            Item(3, "Google Pixel 6", "Pixel phone with Google Tensor chip")
        ).inOrder()
    }

    @Test
    fun `filterItemsLogic returns empty list for no match`() {
        val filtered = filterItemsLogic(sampleItems, "nonexistent")
        assertThat(filtered).isEmpty()
    }

    @Test
    fun `filterItemsLogic handles partial matches in name`() {
        val filtered = filterItemsLogic(sampleItems, "Galax")
        assertThat(filtered).containsExactly(
            Item(2, "Samsung Galaxy S22", "Flagship Android phone by Samsung")
        )
    }

    @Test
    fun `filterItemsLogic handles partial matches in description`() {
        val filtered = filterItemsLogic(sampleItems, "stunning")
        assertThat(filtered).containsExactly(
            Item(5, "Dell XPS 15", "Windows laptop with stunning display")
        )
    }

    @Test
    fun `filterItemsLogic with empty allItems list`() {
        val filtered = filterItemsLogic(emptyList(), "anyQuery")
        assertThat(filtered).isEmpty()
    }

    @Test
    fun `filterItemsLogic with empty allItems list and empty query`() {
        val filtered = filterItemsLogic(emptyList(), "")
        assertThat(filtered).isEmpty()
    }
}
// Placeholder for Item data class if not defined elsewhere accessible to this test
// data class Item(val id: Int, val name: String, val description: String)

// Placeholder for filterItemsLogic function if not defined elsewhere accessible to this test
/*
fun filterItemsLogic(allItems: List<Item>, query: String): List<Item> {
    if (query.isBlank()) {
        return allItems
    }
    val lowerCaseQuery = query.lowercase()
    return allItems.filter { item ->
        item.name.lowercase().contains(lowerCaseQuery) ||
        item.description.lowercase().contains(lowerCaseQuery)
    }
}
*/
