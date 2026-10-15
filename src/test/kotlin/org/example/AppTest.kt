package org.example

import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals

class AppTest {
    @Test
    fun messagePayloadReportsKotLib2Version() {
        val payload = messagePayload()
        assertContains(payload, "\"name\":\"kot-lib-2\"")
        assertContains(payload, "\"version\":\"0.1.0\"")
        assertEquals("0.1.0", Kotlib2.version())
    }
}
