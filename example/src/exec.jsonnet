// Jsonnet Example
{
	person1: import "person1.jsonnet",
	person2: self.person1 { name: "Bob" },
}
