<?php

namespace App\Imports;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Warehouse;
use Infobip\ApiException;
use App\Models\product_warehouse;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ProductImport implements ToArray, WithHeadingRow
{

    public function array(array $products)
    {
        // try {
        //     DB::transaction(function () use ($products) {
        $user_auth = auth()->user();
        foreach ($products as $product) {
            Log::info('Processing product: ' . json_encode($product));
            // if (
            //     !array_key_exists('name', $product) || !array_key_exists('Type_barcode', $product) || !array_key_exists('sku_code', $product) || !array_key_exists('ean_code', $product) || !array_key_exists('batch_code', $product) || !array_key_exists('buying_price', $product)  ||
            //     !array_key_exists('category', $product) || !array_key_exists('brand', $product) || !array_key_exists('weight', $product) || !array_key_exists('weight_unit', $product) || !array_key_exists('length', $product) || !array_key_exists('width', $product) || !array_key_exists('height', $product) ||  !array_key_exists('cpnp', $product) ||
            //     !array_key_exists('RRP', $product) || !array_key_exists('made_in', $product) || !array_key_exists('sales_unit_price', $product) || !array_key_exists('ingredients', $product) || !array_key_exists('product_usage', $product) || !array_key_exists('composition', $product) ||
            //     !array_key_exists('hs_code', $product) || !array_key_exists('stock_alert', $product) || !array_key_exists('production_date', $product) || !array_key_exists('expiry_date', $product) ||
            //     !array_key_exists('image', $product) || !array_key_exists('artwork_file_link', $product) ||  !array_key_exists('description', $product)
            // ) {
            //     return back()->with('error', 'Field missing from header.');
            // }
            $productName = trim($product['name']);
            // $productCount = Product::where('name', $productName)->count();
            // if ($productCount > 0) {
            //     return back()->with('error', 'Product ' . $productName . ' Already Exists');
            // }
            
            // Category
            $categoryName = trim($product['category']);
            $category = Category::where('name', $categoryName)->first();
            if (!$category) {
                return back()->with('error', 'Category Not Found');
            }

            Log::info('Working there...');
            // Brand
            $brandName = trim($product['brand']);
            $brand = Brand::where('name', $brandName)->first();
            if (!$brand) {
                return back()->with('error', 'Brand Not Found');
            }

            // // Unit
            // $unitName = trim($product['unit']);
            // $unit = Unit::where('name', $unitName)->first();
            // if (!$unit) {
            //     throw new ApiException('Unit Not Found');
            // }

            $barcodeSymbology = trim($product['type_barcode']);
            if ($barcodeSymbology == "") {
                return back()->with('error', 'Type_barcode Not Found');
            }
            //Log::info('Working there...');
            $itemCode = trim($product['sku_code']);
            $isItemCodeAlreadyExists = Product::where('sku_code', $itemCode)->count();
            if ($isItemCodeAlreadyExists > 0) {
                return back()->with('error', 'SKU Code ' . $itemCode . ' Already Exists');
            }

            $eanCode = trim($product['ean_code']);
            $iseanCodeAlreadyExists = Product::where('ean_code', $eanCode)->count();
            if ($iseanCodeAlreadyExists > 0) {
                return back()->with('error', 'Ean Code ' . $eanCode . ' Already Exists');
            }
            
            //-- Create New Product
            $Product = new Product;
            //-- Field Required
            // $Product->type         = $request['type'];
            $Product->name         = $productName;
            $Product->ean_code         = $eanCode;
            $Product->Type_barcode = $barcodeSymbology;
            $Product->sku_code         = $itemCode;
            $Product->batch_code         = trim($product['batch_code']);
            $Product->buying_price         = trim($product['buying_price']);
            $Product->category_id  = $category->id;
            $Product->brand_id     = $brand->id;
            $Product->unit_id     = NULL;
            $Product->image              = trim($product['image']);
            $Product->weight         = trim($product['weight']);
            $Product->weight_unit        = trim($product['weight_unit']);
            $Product->length         = trim($product['length']);
            $Product->width         = trim($product['width']);
            $Product->height         = trim($product['height']);
            $Product->cpnp         = trim($product['cpnp']);
            $Product->made_in         = trim($product['made_in']);
            $Product->ingredients         = trim($product['ingredients']);
            $Product->product_usage         = trim($product['product_usage']);
            $Product->composition         = trim($product['composition']);
            $Product->hs_code         = trim($product['hs_code']);
            $Product->selling_unit_price         = trim($product['selling_unit_price']);
            $Product->rrp         = trim($product['rrp']);
            $Product->note         = trim($product['description']);
            $Product->stock_alert         = trim($product['stock_alert']);
            $Product->production_date         = trim($product['production_date']);
            $Product->expiry_date         = trim($product['expiry_date']);
            $Product->artwork_file_link              = trim($product['artwork_file_link']);
            $manage_stock = 0;
            $Product->save();


            //--Store Product Warehouse
            $warehouses = Warehouse::where('deleted_at', null)->pluck('id')->toArray();
            if ($warehouses) {
                foreach ($warehouses as $warehouse) {
                    $product_warehouse[] = [
                        'product_id' => $Product->id,
                        'warehouse_id' => $warehouse,
                        'manage_stock' => $manage_stock,
                    ];
                }
                product_warehouse::insert($product_warehouse);
            }
        }
        //     });
        // } catch (\Exception $e) {
        //     Log::error('DB Transaction Exception: ' . $e->getMessage());
        // }
    }
}
