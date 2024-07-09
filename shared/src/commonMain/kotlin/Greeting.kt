class Greeting {
    private val platform = getPlatform()

    fun greet(): String {
        (1..10000).forEach {
            val test = mapOf("test" to "test")
            println(test)
        }
        return "Hello, ${platform.name}!"
    }
}