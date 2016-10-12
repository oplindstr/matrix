require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe DocumentGroupCategoriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # DocumentGroupCategory. As you add validations to DocumentGroupCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DocumentGroupCategoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all document_group_categories as @document_group_categories" do
      document_group_category = DocumentGroupCategory.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:document_group_categories)).to eq([document_group_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested document_group_category as @document_group_category" do
      document_group_category = DocumentGroupCategory.create! valid_attributes
      get :show, {:id => document_group_category.to_param}, valid_session
      expect(assigns(:document_group_category)).to eq(document_group_category)
    end
  end

  describe "GET #new" do
    it "assigns a new document_group_category as @document_group_category" do
      get :new, {}, valid_session
      expect(assigns(:document_group_category)).to be_a_new(DocumentGroupCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested document_group_category as @document_group_category" do
      document_group_category = DocumentGroupCategory.create! valid_attributes
      get :edit, {:id => document_group_category.to_param}, valid_session
      expect(assigns(:document_group_category)).to eq(document_group_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DocumentGroupCategory" do
        expect {
          post :create, {:document_group_category => valid_attributes}, valid_session
        }.to change(DocumentGroupCategory, :count).by(1)
      end

      it "assigns a newly created document_group_category as @document_group_category" do
        post :create, {:document_group_category => valid_attributes}, valid_session
        expect(assigns(:document_group_category)).to be_a(DocumentGroupCategory)
        expect(assigns(:document_group_category)).to be_persisted
      end

      it "redirects to the created document_group_category" do
        post :create, {:document_group_category => valid_attributes}, valid_session
        expect(response).to redirect_to(DocumentGroupCategory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved document_group_category as @document_group_category" do
        post :create, {:document_group_category => invalid_attributes}, valid_session
        expect(assigns(:document_group_category)).to be_a_new(DocumentGroupCategory)
      end

      it "re-renders the 'new' template" do
        post :create, {:document_group_category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested document_group_category" do
        document_group_category = DocumentGroupCategory.create! valid_attributes
        put :update, {:id => document_group_category.to_param, :document_group_category => new_attributes}, valid_session
        document_group_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested document_group_category as @document_group_category" do
        document_group_category = DocumentGroupCategory.create! valid_attributes
        put :update, {:id => document_group_category.to_param, :document_group_category => valid_attributes}, valid_session
        expect(assigns(:document_group_category)).to eq(document_group_category)
      end

      it "redirects to the document_group_category" do
        document_group_category = DocumentGroupCategory.create! valid_attributes
        put :update, {:id => document_group_category.to_param, :document_group_category => valid_attributes}, valid_session
        expect(response).to redirect_to(document_group_category)
      end
    end

    context "with invalid params" do
      it "assigns the document_group_category as @document_group_category" do
        document_group_category = DocumentGroupCategory.create! valid_attributes
        put :update, {:id => document_group_category.to_param, :document_group_category => invalid_attributes}, valid_session
        expect(assigns(:document_group_category)).to eq(document_group_category)
      end

      it "re-renders the 'edit' template" do
        document_group_category = DocumentGroupCategory.create! valid_attributes
        put :update, {:id => document_group_category.to_param, :document_group_category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested document_group_category" do
      document_group_category = DocumentGroupCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => document_group_category.to_param}, valid_session
      }.to change(DocumentGroupCategory, :count).by(-1)
    end

    it "redirects to the document_group_categories list" do
      document_group_category = DocumentGroupCategory.create! valid_attributes
      delete :destroy, {:id => document_group_category.to_param}, valid_session
      expect(response).to redirect_to(document_group_categories_url)
    end
  end

end