const fastify = require("fastify")({ logger: true });

fastify.register(require("@fastify/cors"), {
  origin: true,
});

const toppings = [
  { id: 1, name: "Сир" },
  { id: 2, name: "Бекон" },
  { id: 3, name: "Оливки" },
  { id: 4, name: "Курка" },
  { id: 5, name: "Салямі" },
  { id: 6, name: "Кукурудза" },
  { id: 7, name: "Солоні огірки" },
  { id: 8, name: "Гриби" },
  { id: 9, name: "Ананас" },
  { id: 10, name: "Помідор" },
  { id: 11, name: "Чілі" },
];

fastify.get("/toppings", async (request, reply) => {
  return toppings;
});

const start = async () => {
  try {
    await fastify.listen({ port: 3000, host: "0.0.0.0" });
    console.log("Server running on http://localhost:3000");
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();
