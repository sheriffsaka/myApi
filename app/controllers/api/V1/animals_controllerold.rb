module Api
    module V1
        class AnimalsController < ApplicationController
            def index
                animals = Animal.order('created_at', DESC);
                render json: {status: 'SUCCESS', message: 'Loaded animals', data: animals}, status::ok
            end

            def show
                animals = Animal.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded animals', data: animals}, status::ok
            end

            def create
                animal = Animal.new(animal_params)
                if animal.save
                    render json: {status: 'SUCCESS', message: 'New animal added successfully', data: animals}, status::ok
                else
                    render json: {status: 'ERROR', message: 'Animal not saved', data: animal}, status::unprocessable_entity
                end
            end

            def destroy
                animal = Animal.find(params[:id])
                animal.destroy

                render json: {status: 'SUCCESS', message: 'Animal record successfully deleted', data: animal}, status::ok
            end

            def update
                animal = Animal.find(:[id])
                if animal.update_attributes(animal_params)
                    render json: {status: 'SUCCESS', message: 'Animal record updated successfully', data: animals}, status::ok
                else
                    render json: {status: 'ERROR', message: 'Animal record NOT updated', data: animals}, status::ok
                end
            end

            private

            def animal_params
                params.permit(:aname)
            end
        end
    end
end