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

const pizzas = [
  {
    id: "p1",
    name: "Маргарита",
    size: "medium",
    toppings: ["Томатний соус", "Моцарела", "Базилік"],
    price: 180,
  },
  {
    id: "p2",
    name: "Пепероні",
    size: "medium",
    toppings: ["Томатний соус", "Моцарела", "Гострі ковбаски Пепероні"],
    price: 250.0,
  },
  {
    id: "p3",
    name: "Гавайська",
    size: "medium",
    toppings: ["Томатний соус", "Моцарела", "Куряче філе", "Ананаси"],
    price: 230.0,
  },
];

fastify.get("/toppings", async (request, reply) => {
  return toppings;
});

fastify.get("/pizzas", async (request, reply) => {
  return pizzas;
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
