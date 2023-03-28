// Code generated by MockGen. DO NOT EDIT.
// Source: github.com/rudderlabs/rudder-server/processor/transformer (interfaces: Transformer)

// Package mocks_transformer is a generated GoMock package.
package mocks_transformer

import (
	context "context"
	reflect "reflect"

	gomock "github.com/golang/mock/gomock"
	transformer "github.com/rudderlabs/rudder-server/processor/transformer"
)

// MockTransformer is a mock of Transformer interface.
type MockTransformer struct {
	ctrl     *gomock.Controller
	recorder *MockTransformerMockRecorder
}

// MockTransformerMockRecorder is the mock recorder for MockTransformer.
type MockTransformerMockRecorder struct {
	mock *MockTransformer
}

// NewMockTransformer creates a new mock instance.
func NewMockTransformer(ctrl *gomock.Controller) *MockTransformer {
	mock := &MockTransformer{ctrl: ctrl}
	mock.recorder = &MockTransformerMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockTransformer) EXPECT() *MockTransformerMockRecorder {
	return m.recorder
}

// Setup mocks base method.
func (m *MockTransformer) Setup() {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "Setup")
}

// Setup indicates an expected call of Setup.
func (mr *MockTransformerMockRecorder) Setup() *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "Setup", reflect.TypeOf((*MockTransformer)(nil).Setup))
}

// Transform mocks base method.
func (m *MockTransformer) Transform(arg0 context.Context, arg1 []transformer.TransformerEventT, arg2 string, arg3 int) transformer.ResponseT {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "Transform", arg0, arg1, arg2, arg3)
	ret0, _ := ret[0].(transformer.ResponseT)
	return ret0
}

// Transform indicates an expected call of Transform.
func (mr *MockTransformerMockRecorder) Transform(arg0, arg1, arg2, arg3 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "Transform", reflect.TypeOf((*MockTransformer)(nil).Transform), arg0, arg1, arg2, arg3)
}

// Validate mocks base method.
func (m *MockTransformer) Validate(arg0 []transformer.TransformerEventT, arg1 string, arg2 int) transformer.ResponseT {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "Validate", arg0, arg1, arg2)
	ret0, _ := ret[0].(transformer.ResponseT)
	return ret0
}

// Validate indicates an expected call of Validate.
func (mr *MockTransformerMockRecorder) Validate(arg0, arg1, arg2 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "Validate", reflect.TypeOf((*MockTransformer)(nil).Validate), arg0, arg1, arg2)
}