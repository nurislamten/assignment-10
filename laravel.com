
Task1:
composer create-project --prefer-dist laravel/laravel MigrationAssignment

Task:2

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->decimal('price', 10, 2);
            $table->text('description');
            $table->timestamps(); // This creates created_at and updated_at columns
        });
    }

    public function down()
    {
        Schema::dropIfExists('products');
    }
}

Task3:
php artisan migrate

Task4:


use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddQuantityToProductsTable extends Migration
{
   
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->integer('quantity')->nullable()->after('description');
        });
    }
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('quantity');
        });
    }
}

Task5:
rails generate migration AddCategoryToProductsTable category:string{50}

Task6:

rails db:migrate

Task7:
rails generate migration CreateOrdersTable product_id:integer:unsigned quantity:integer
class CreateOrdersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :product_id, unsigned: true
      t.integer :quantity
      t.timestamps
    end
  end
end

Task8:
rails db:migrate
