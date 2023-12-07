
db.createCollection("product");

db.product.deleteMany({});

db.getCollection("product").insertMany([
    {
        id: 1,
        prod_id: 'P-01',
        prod_name: 'iPhone',
        prod_price: 100000,
        prod_quantity: 10,
        created_date: ISODate("2023/04/05T00:00:00Z"),
        updated_date: ISODate("2023/05/05T00:00:00Z"),
        created_by: "Admin",
        updated_by: "Subha"
    },
    {
        id: 2,
        prod_id: 'P-02',
        prod_name: 'Watches',
        prod_price: 20000,
        prod_quantity: 22,
        created_date: ISODate("2022/11/17T00:00:00Z"),
        updated_date: ISODate("2023/09/15T00:00:00Z"),
        created_by: "Admin",
        updated_by: "Subha"
    },
    {
        id: 3,
        prod_id: 'P-03',
        prod_name: 'Shoes',
        prod_price: 6000,
        prod_quantity: 23,
        created_date: ISODate("2023/01/23T00:00:00Z"),
        updated_date: ISODate("2023/08/10T00:00:00Z"),
        created_by: "Admin",
        updated_by: "Subha"
    },
    {
        id: 4,
        prod_id: 'P-04',
        prod_name: 'Bags',
        prod_price: 4000,
        prod_quantity: 18,
        created_date: ISODate("2023/10/01T00:00:00Z"),
        updated_date: ISODate("2023/12/05T00:00:00Z"),
        created_by: "Admin",
        updated_by: "Subha"
    },
    {
        id: 5,
        prod_id: 'P-05',
        prod_name: 'T-Shirt',
        prod_proce: 700,
        prod_quantity: 30,
        created_date: ISODate("2022/09/25T00:00:00Z"),
        updated_date: ISODate("2023/07/03T00:00:00Z"),
        created_by: "Admin",
        updated_by: "Subha"
    },
]);



//Find all the documents
db.getCollection("product").find({});

db.product.find({ prod_price: { $lte: 4000, $gte: 500 } });

//Chooses the specific document
db.product.aggregate([
    { $match: { name: 'Bags', prod_id: 'P-04' } }]);

//Average price
const avg = db.getCollection("product").
    aggreagte([
        {
            $group:
                {
                    _id: "$inventory_id",
                    avg: { $avg: "$prod_price" }
                }
        }
    ]);

//Count the number of products lesser than 20
const count = db.getCollection("products").
    aggregate([
        {
            $match:
                {
                    product_quantity: { $lt: 20 }
                }
        },
        {
            $group:
                {
                    _id: null,
                    totalProducts: { $sum: 1 }
                }
        }
    ]);
